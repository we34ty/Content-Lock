##Easier way to restore 'x' health, since all calculations are done here. 
#The input value must be multiplied by 1000 (ex. 1hp heal = value:1000)
$scoreboard players set @s content_lock.temp3 $(value)
execute store result score @s content_lock.temp1 run data get entity @s Health 1000
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp3
execute store result score @s content_lock.temp2 run attribute @s max_health get 1000
scoreboard players operation @s content_lock.temp1 < @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
data merge storage content_lock:saved_stats {value:0.0f}
execute store result storage content_lock:saved_stats value float 0.001 run scoreboard players get @s content_lock.temp1
function content_lock:player/passives/heal_macro with storage content_lock:saved_stats
