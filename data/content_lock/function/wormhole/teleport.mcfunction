execute at @e[tag=content_lock.wormhole,limit=1,sort=nearest] run playsound minecraft:block.content_lock.wormhole.teleport block @a ~ ~ ~ 1 1
execute at @e[tag=content_lock.wormhole,limit=1,sort=nearest] run particle portal ~ ~ ~ 0 0 0 1 20 normal @a
data merge storage content_lock:saved_stats {x:0.0d,y:0.0d,z:0.0d}
execute store result storage content_lock:saved_stats x double 1 run scoreboard players get @e[tag=content_lock.wormhole,limit=1,sort=nearest] content_lock.stored_x
execute store result storage content_lock:saved_stats y double 1 run scoreboard players get @e[tag=content_lock.wormhole,limit=1,sort=nearest] content_lock.stored_y
execute store result storage content_lock:saved_stats z double 1 run scoreboard players get @e[tag=content_lock.wormhole,limit=1,sort=nearest] content_lock.stored_z
function content_lock:wormhole/teleport_with_args with storage content_lock:saved_stats
