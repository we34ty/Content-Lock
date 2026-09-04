$execute unless data storage content_lock:saved_stats status_effects.$(type) unless data storage content_lock:saved_stats status_effect_modifiers.$(type)[0] run return 0
$execute store result score @s content_lock.temp2 run data get storage content_lock:saved_stats $(type)_status 1
$execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats status_effects.$(type) 1
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000
$data merge storage content_lock:saved_stats {type:"$(type)",i:0}

$execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats status_effect_modifiers.$(type)
scoreboard players remove @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 0.. store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 0.. run function content_lock:player/passives/damage/calculate_status_storage_loop with storage content_lock:saved_stats

$execute store result score @s content_lock.timer1 run data get storage content_lock:saved_stats weapon_cache.status_effect_modifiers.$(type)
scoreboard players remove @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 0.. store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
execute if score @s content_lock.timer1 matches 0.. run function content_lock:player/passives/damage/calculate_status_item_loop with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp3 += @s content_lock.temp1
$execute store result storage content_lock:weapon_stats data.$(type)_status int 0.001 run scoreboard players get @s content_lock.temp1