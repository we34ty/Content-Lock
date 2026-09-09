## Store the damage taken as scoreboard to be reduced by the armor and bonuses
$execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats $(path)_status 1000

## Calculate the resistance of boots
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[0]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[0]."status_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:0}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_status_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of leggings
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[1]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[1]."status_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:1}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_status_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of chestplate
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[2]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[2]."status_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:2}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_status_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of helmet
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[3]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[3]."status_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:3}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_status_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of the bonuses the player might have, such as enchantments or passives
scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:weapon_stats status_effect_resistances.$(path)
data merge storage content_lock:saved_stats {i:0}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_storage_status_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

## store the final damage after armor and bonuses in the storage for the entity to use
$execute store result storage content_lock:saved_stats $(path)_status int 0.001 run scoreboard players get @s content_lock.temp1
