execute at @e[tag=content_lock.wormhole,limit=1,sort=nearest] run playsound minecraft:block.content_lock.wormhole.teleport block @a ~ ~ ~ 1 1
execute at @e[tag=content_lock.wormhole,limit=1,sort=nearest] run particle portal ~ ~ ~ 0 0 0 1 20 normal @a
data merge storage content_lock:saved_stats {x:0.0d,y:0.0d,z:0.0d}
execute store result storage content_lock:saved_stats x double 1 run scoreboard players get @e[tag=content_lock.wormhole,limit=1,sort=nearest] content_lock.stored_x
execute store result storage content_lock:saved_stats y double 1 run scoreboard players get @e[tag=content_lock.wormhole,limit=1,sort=nearest] content_lock.stored_y
execute store result storage content_lock:saved_stats z double 1 run scoreboard players get @e[tag=content_lock.wormhole,limit=1,sort=nearest] content_lock.stored_z

tag @s add content_lock.load_chunk_no_gravity
attribute @s gravity modifier add content_lock.load_chunk_no_gravity -1 add_multiplied_total

damage @s 1 mob_attack by @e[tag=aj.wormhole.root,limit=1,sort=nearest] from @e[tag=aj.wormhole.root,limit=1,sort=nearest] 

function content_lock:wormhole/teleport_with_args with storage content_lock:saved_stats


