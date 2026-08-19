$execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats $(path) 1000
$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[0]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[1]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[2]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

$execute if entity @s store result score @s content_lock.temp2 run data get storage content_lock:saved_stats cached_armor[3]."status_resistance"."$(path)" 10
scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

$execute store result storage content_lock:saved_stats $(path) int 0.001 run scoreboard players get @s content_lock.temp1
