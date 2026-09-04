## Check amount of pieces of copper armor to set the base damage of the lightning attack
scoreboard players set @s content_lock.temp1 0
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 1 run scoreboard players set @s content_lock.temp1 5000
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 2 run scoreboard players set @s content_lock.temp1 8000
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 3 run scoreboard players set @s content_lock.temp1 11000
execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 4 run scoreboard players set @s content_lock.temp1 15000

## Multiply the the base damage by player level in movement speed (1% for each lvl)
scoreboard players operation @s content_lock.temp2 = @s content_lock.mvtspd_from_level
scoreboard players set @s content_lock.temp3 10
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp3
scoreboard players add @s content_lock.temp2 1000

scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

## Store the damage in a storage for the lightning projectile to use and split it into the different damage types
data modify storage content_lock:saved_stats {} set value {UUID:[I;0,0,0,0],damage_type:"magic",physical_damage:0.0f,fire_damage:0.0f,frost_damage:0.0f,magic_damage:0.0f,wither_damage:0.0f,ender_damage:0.0f,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
execute store result storage content_lock:saved_stats fire_damage float 0.0005 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats magic_damage float 0.0005 run scoreboard players get @s content_lock.temp1
data modify storage content_lock:saved_stats UUID set from entity @s UUID

## Decrease the amount of charges by half
scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s content_lock.enchantment.bonus.armor.copper.charges /= @s content_lock.temp1

## Calculate the damage multipliers from the player's stats
function content_lock:player/passives/damage/calculate_damage_no_item
data modify storage content_lock:saved_stats {} set from storage content_lock:weapon_stats data

## Spawn the lightning projectile in a 14x14x14 area around the player
execute positioned ~-7 ~-7 ~-7 as @e[type=!#entities,dx=14,dz=14,dy=14] at @s run function content_lock:player/enchantments/bonuses/armor/copper/spawn_lightning_projectile with storage content_lock:saved_stats

## Remove the tag so this doesn't run again until the player takes damage at max stacks again
tag @s remove content_lock.enchantment.bonus.armor.copper.send_lightning