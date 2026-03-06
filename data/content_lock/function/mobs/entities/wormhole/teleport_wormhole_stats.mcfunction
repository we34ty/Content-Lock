playsound content_lock:block.wormhole.teleport block @a ~ ~ ~ 1 1
particle portal ~ ~ ~ 0 0 0 1 20 normal @a
data merge storage content_lock:saved_stats {x:0.0d,y:0.0d,z:0.0d}
execute store result storage content_lock:saved_stats x double 1 run scoreboard players get @s content_lock.stored_x
execute store result storage content_lock:saved_stats y double 1 run scoreboard players get @s content_lock.stored_y
execute store result storage content_lock:saved_stats z double 1 run scoreboard players get @s content_lock.stored_z

