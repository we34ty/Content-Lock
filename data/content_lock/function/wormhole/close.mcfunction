data merge storage content_lock:saved_stats {x:0.0d,y:63.0d,z:0.0d}
execute store result storage content_lock:saved_stats x double 1 run scoreboard players get @s content_lock.stored_x
execute store result storage content_lock:saved_stats y double 1 run scoreboard players get @s content_lock.stored_y
execute store result storage content_lock:saved_stats z double 1 run scoreboard players get @s content_lock.stored_z
execute at @s if block ~ ~-1 ~ #air run function content_lock:wormhole/remove_twin with storage content_lock:saved_stats
execute at @s if block ~ ~-1 ~ #air run return run function animated_java:wormhole/remove/this
function animated_java:wormhole/variants/default/apply
tag @s remove content_lock.wormhole.open
execute at @s run playsound minecraft:block.content_lock.wormhole.close block @a ~ ~ ~ 1 1
