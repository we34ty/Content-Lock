execute unless block ~ ~-0.2 ~ #water_filled run return run kill @s

execute store result score @s content_lock.fishing.temp1 run random value -20..20
scoreboard players operation @s content_lock.fishing.yaw += @s content_lock.fishing.temp1

execute if score @s content_lock.fishing.yaw matches ..-181 run scoreboard players add @s content_lock.fishing.yaw 360
execute if score @s content_lock.fishing.yaw matches 181.. run scoreboard players remove @s content_lock.fishing.yaw 360

data merge storage content_lock:saved_stats {yaw:0}
execute store result storage content_lock:saved_stats yaw int 1 run scoreboard players get @s content_lock.fishing.yaw
function content_lock:player/passives/fishing/fish_move with storage content_lock:saved_stats