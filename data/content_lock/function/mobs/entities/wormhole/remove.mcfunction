#store the position it's pointing towards to proprely remove the matched wormhole
data merge storage content_lock:saved_stats {x:0.0d,y:63.0d,z:0.0d}
execute store result storage content_lock:saved_stats x double 1 run scoreboard players get @s content_lock.stored_x
execute store result storage content_lock:saved_stats y double 1 run scoreboard players get @s content_lock.stored_y
execute store result storage content_lock:saved_stats z double 1 run scoreboard players get @s content_lock.stored_z
#remove the matched wormhole
function content_lock:mobs/entities/wormhole/remove_twin with storage content_lock:saved_stats
function animated_java:wormhole/remove/this