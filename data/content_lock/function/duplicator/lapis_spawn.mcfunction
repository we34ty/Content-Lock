$execute if score @s content_lock.temp3 matches 65.. run summon item ~ ~ ~ {Item:{id:"$(item)",count:64}}
$execute if score @s content_lock.temp3 matches ..64 run summon item ~ ~ ~ {Item:{id:"$(item)",count:$(count)}}

scoreboard players remove @s content_lock.temp3 64
execute store result storage content_lock:saved_stats count int 1 run scoreboard players get @s content_lock.temp3
execute if score @s content_lock.temp3 matches 1.. run function content_lock:duplicator/lapis_spawn with storage content_lock:saved_stats