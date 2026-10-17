scoreboard players remove @s content_lock.corruption_meter 600
execute if score @s content_lock.corruption_meter matches ..0 run function content_lock:player/effects/corruption/remove

execute unless score @s content_lock.corruption_time matches 120.. run scoreboard players add @s content_lock.corruption_time 1
particle crimson_spore ~ ~1 ~ 4 2 4 0.2 20 force @a
particle crimson_spore ~ ~1 ~ 1 2 1 0.2 20 force @a

execute as @e[type=!#entities,distance=0.01..2] run function content_lock:player/effects/corruption/apply {amount: 700}
execute as @e[type=!#entities,distance=0.01..4] run function content_lock:player/effects/corruption/apply {amount: 600}
execute as @e[type=!#entities,distance=0.01..7] run function content_lock:player/effects/corruption/apply {amount: 500}


execute unless score @s content_lock.corruption_time matches 21.. run return 0
attribute @s max_health modifier remove content_lock.corruption
scoreboard players operation @s content_lock.temp1 = @s content_lock.corruption_time
scoreboard players remove @s content_lock.temp1 20
data merge storage content_lock:saved_stats {value: 0}
execute store result storage content_lock:saved_stats value float -0.005 run scoreboard players get @s content_lock.temp1
function content_lock:player/effects/corruption/reduce_health with storage content_lock:saved_stats