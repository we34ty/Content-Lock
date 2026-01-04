execute store result score @s content_lock.temp1 run attribute @s max_health get 1000
scoreboard players set @s content_lock.temp2 3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2
scoreboard players add @s content_lock.temp1 2000

particle heart ~ ~1.8 ~ 0.2 0 0.2 1 5 normal @a
playsound block.brewing_stand.brew player @a ~ ~ ~ 0.3 1.5


data merge storage content_lock:saved_stats {value:0.0f}
execute store result storage content_lock:saved_stats value float 0.001 run scoreboard players get @s content_lock.temp1
function content_lock:player/passives/heal_macro_easy with storage content_lock:saved_stats
tag @s add content_lock.remove_health_deprived_2_ticks
