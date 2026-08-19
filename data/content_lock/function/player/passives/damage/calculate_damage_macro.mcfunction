$execute unless data storage content_lock:saved_stats damage.$(type) unless data storage content_lock:saved_stats damage_modifiers.$(type)[0] unless data storage content_lock:saved_stats weapon_cache.damage.$(type) unless data storage content_lock:saved_stats weapon_cache.damage_modifiers.$(type)[0] run return 0
$execute store result score @s content_lock.temp2 run data get storage content_lock:saved_stats weapon_cache.damage.$(type) 1000
$execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats damage.$(type) 1000
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000
$data merge storage content_lock:saved_stats {type:"$(type)",i:0}

$execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats damage_modifiers.$(type)
scoreboard players remove @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 0.. store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 0.. run function content_lock:player/passives/damage/calculate_damage_storage_loop with storage content_lock:saved_stats

$execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats weapon_cache.damage_modifiers.$(type)
scoreboard players remove @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 0.. store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 0.. run function content_lock:player/passives/damage/calculate_damage_item_loop with storage content_lock:saved_stats

#execute if entity @s[tag=content_lock.weapons.add_jumping_damage] run scoreboard players add @s content_lock.temp2 500
#execute if entity @s[tag=content_lock.weapons.add_running_damage] run scoreboard players add @s content_lock.temp2 150
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp3 += @s content_lock.temp1
$execute store result storage content_lock:weapon_stats data.$(type)_damage float 0.000001 run scoreboard players get @s content_lock.temp1