$execute store result score @s content_lock.temp2 run data get entity @s SelectedItem.components."minecraft:custom_data"."content_lock:weapon".status_effects.$(type) 1
$execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats status_effects.$(type) 1
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players set @s content_lock.timer1 0
scoreboard players set @s content_lock.temp2 1000
$data merge storage content_lock:saved_stats {type:"$(type)",i:0}
function content_lock:player/passives/damage/calculate_damage_storage_loop with storage content_lock:saved_stats
$data merge storage content_lock:saved_stats {type:"$(type)",i:0}
function content_lock:player/passives/damage/calculate_damage_item_loop with storage content_lock:saved_stats
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
$execute store result storage content_lock:weapon_stats data.$(type)_status int 0.001 run scoreboard players get @s content_lock.temp1