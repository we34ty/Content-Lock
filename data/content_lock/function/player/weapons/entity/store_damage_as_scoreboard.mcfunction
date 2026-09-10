$data merge storage content_lock:saved_stats {value:$(value)}
execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats value 1
scoreboard players operation @s content_lock.check_for_damage_dealt += @s content_lock.temp1