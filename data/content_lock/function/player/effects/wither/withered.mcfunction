execute store result score @s content_lock.temp1 run data get entity @s active_effects[{"id":"minecraft:wither"}].duration 1
execute store result score @s content_lock.temp2 run data get entity @s active_effects[{"id":"minecraft:wither"}].amplifier 1
scoreboard players add @s content_lock.temp2 1
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
data merge storage content_lock:saved_stats {amount:0}
execute store result storage content_lock:saved_stats amount int 10 run scoreboard players get @s content_lock.temp1
effect clear @s minecraft:wither
function content_lock:player/effects/wither/apply with storage content_lock:saved_stats
