## Updates stats for anyone with at least 1 piece of copper armor, based on the number of pieces and the number of charges they have

## Get the number of charges above 50 and multiply it by 5 to get the decimal value for the stats
scoreboard players operation @s content_lock.temp1 = @s content_lock.enchantment.bonus.armor.copper.charges
scoreboard players remove @s content_lock.temp1 50

##*1000 for decimals and /200 for max charges of 250, so multiply by 5
scoreboard players set @s content_lock.temp2 5
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

## Set the base stats based on the number of pieces of copper armor the player has
scoreboard players set @s content_lock.temp2 0
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 1 run scoreboard players set @s content_lock.temp2 10
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 2 run scoreboard players set @s content_lock.temp2 15
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 3 run scoreboard players set @s content_lock.temp2 20
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 4 run scoreboard players set @s content_lock.temp2 25
## Multiply the base stats by the number of charges above 50 to get the final stat value
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

## Store the final stat value in a storage for the update_stats_macro function to use
data merge storage content_lock:saved_stats {value:0.0f}
execute store result storage content_lock:saved_stats value float 0.00001 run scoreboard players get @s content_lock.temp1
function content_lock:player/enchantments/bonuses/armor/copper/update_stats_macro with storage content_lock:saved_stats