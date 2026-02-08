$data merge storage content_lock:saved_stats {damage:$(damage_mult),damage_type:$(damage_type),distance:$(distance),half_distance:$(half_distance)}
execute store result score @s content_lock.temp1 run attribute @s attack_damage get 1000
execute store result score @s content_lock.temp2 run data get storage content_lock:saved_stats damage 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
execute store result storage content_lock:saved_stats damage double 0.001 run scoreboard players get @s content_lock.temp1

function content_lock:mobs/bosses/universal/damage_player_d with storage content_lock:saved_stats