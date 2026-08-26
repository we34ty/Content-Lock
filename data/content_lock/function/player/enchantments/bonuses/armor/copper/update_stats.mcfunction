scoreboard players operation @s content_lock.temp1 = @s content_lock.enchantment.bonus.armor.copper.charges
scoreboard players remove @s content_lock.temp1 50

##*1000 for decimals and /200 for max charges of 250, so multiply by 5
scoreboard players set @s content_lock.temp2 5
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 1 run scoreboard players set @s content_lock.temp2 10
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 2 run scoreboard players set @s content_lock.temp2 15
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 3 run scoreboard players set @s content_lock.temp2 20
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 4 run scoreboard players set @s content_lock.temp2 25
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

data merge storage content_lock:saved_stats {value:0.0f}
execute store result storage content_lock:saved_stats value float 0.00001 run scoreboard players get @s content_lock.temp1
function content_lock:player/enchantments/bonuses/armor/copper/update_stats_macro with storage content_lock:saved_stats