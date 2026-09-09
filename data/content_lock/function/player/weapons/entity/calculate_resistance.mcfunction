## Store the damage taken as scoreboard to be reduced by the armor and bonuses
$execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats $(path)_damage 1000

#$tellraw @s [{text:"Beginning damage of $(path): ",color:"gold"},{storage:"content_lock:saved_stats",nbt:"$(path)_damage",color:"red"}]
#$tellraw @s [{text:"Boots resistance: ",color:"blue"},{storage:"content_lock:saved_stats",nbt:"cached_armor[0].damage_resistance.$(path)",color:"yellow"}]
#$tellraw @s [{text:"Leggings resistance: ",color:"blue"},{storage:"content_lock:saved_stats",nbt:"cached_armor[1].damage_resistance.$(path)",color:"yellow"}]
#$tellraw @s [{text:"Chestplate resistance: ",color:"blue"},{storage:"content_lock:saved_stats",nbt:"cached_armor[2].damage_resistance.$(path)",color:"yellow"}]
#$tellraw @s [{text:"Helmet resistance: ",color:"blue"},{storage:"content_lock:saved_stats",nbt:"cached_armor[3].damage_resistance.$(path)",color:"yellow"}]

## Calculate the resistance of boots
scoreboard players set @s content_lock.temp2 0
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[0]."damage_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[0]."damage_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:0}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

## Calculate the resistance of leggings
scoreboard players set @s content_lock.temp2 0
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[1]."damage_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[1]."damage_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:1}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of chestplate
scoreboard players set @s content_lock.temp2 0
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[2]."damage_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[2]."damage_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:2}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of helmet
scoreboard players set @s content_lock.temp2 0
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[3]."damage_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats cached_armor[3]."damage_resistance_modifiers"."$(path)"
data merge storage content_lock:saved_stats {i:0,slot:3}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_armor_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3


## Calculate the resistance of the bonuses the player might have, such as enchantments or passives
scoreboard players set @s content_lock.temp2 0
scoreboard players set @s content_lock.temp3 1000

scoreboard players set @s content_lock.timer1 0
execute store result score @s content_lock.timer1 run data get storage content_lock:weapon_stats damage_resistances.$(path)
data merge storage content_lock:saved_stats {i:0}
execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 1.. run function content_lock:player/weapons/entity/calculate_storage_resistance_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

## store the final damage after armor and bonuses in the storage for the entity to use
$execute store result storage content_lock:saved_stats $(path)_damage double 0.001 run scoreboard players get @s content_lock.temp1

#$tellraw @s [{text:"End damage of $(path): ",color:"green"},{storage:"content_lock:saved_stats",nbt:"$(path)_damage",color:"red"}]