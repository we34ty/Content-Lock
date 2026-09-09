execute if entity @s[tag=content_lock.enchantment.bonus.armor.iron.damaged_already] run return 0
tag @s add content_lock.enchantment.bonus.armor.iron.damaged_already

execute unless score @s content_lock.enchantment.bonus.armor.iron.stacks matches 1.. run return 0
scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.stacks 1
say lol

scoreboard players set @s content_lock.temp1 0
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 1 run scoreboard players set @s content_lock.temp1 4000
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 2 run scoreboard players set @s content_lock.temp1 6000
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 3 run scoreboard players set @s content_lock.temp1 10000
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 4 run scoreboard players set @s content_lock.temp1 15000

## Multiply the the base damage by player level in equip load (1% for each lvl)
scoreboard players operation @s content_lock.temp2 = @s content_lock.eqld_from_level
scoreboard players set @s content_lock.temp3 10
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp3
scoreboard players add @s content_lock.temp2 1000

scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

data modify storage content_lock:saved_stats {} set value {UUID:[I;0,0,0,0],damage_type:"magic",physical_damage:0.0f,fire_damage:0.0f,frost_damage:0.0f,magic_damage:0.0f,wither_damage:0.0f,ender_damage:0.0f,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
execute store result storage content_lock:saved_stats physical_damage float 0.0007 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats frost_damage float 0.0003 run scoreboard players get @s content_lock.temp1
data modify storage content_lock:saved_stats UUID set from entity @s UUID

## Calculate the damage multipliers from the player's stats
function content_lock:player/passives/damage/calculate_damage_no_item
data modify storage content_lock:saved_stats {} set from storage content_lock:weapon_stats data

execute at @s positioned ~-4 ~-1 ~-4 as @e[type=#hostile,dx=8,dy=2,dz=8] run function content_lock:player/enchantments/bonuses/armor/iron/fall_knockup
particle block_crumble{block_state:"stone"} ~ ~0.2 ~ 4 0.2 4 0.4 50 normal
playsound entity.iron_golem.damage player @a ~ ~ ~ 1 0.8