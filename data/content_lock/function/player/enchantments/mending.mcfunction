execute store result score @s content_lock.temp1 run attribute @s max_health get 1000
scoreboard players set @s content_lock.temp2 4
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

execute store result score @s content_lock.temp2 run data get entity @s Health 1000
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players add @s content_lock.temp1 2000


execute store result score @s content_lock.temp2 run attribute @s max_health get 1000
scoreboard players operation @s content_lock.temp1 < @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
data merge storage content_lock:saved_stats {value:0.0f}
execute store result storage content_lock:saved_stats value float 0.001 run scoreboard players get @s content_lock.temp1
function content_lock:player/passives/heal_macro with storage content_lock:saved_stats
tag @s add content_lock.remove_health_deprived_2_ticks
