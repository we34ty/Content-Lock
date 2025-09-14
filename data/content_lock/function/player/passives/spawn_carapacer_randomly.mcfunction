summon marker ~ ~ ~ {Tags:["content_lock.spawn_carapacer_location"]}
execute as @e[tag=content_lock.spawn_carapacer_location,limit=1,sort=nearest] at @s run spreadplayers ~ ~ 30 30 false @s
execute at @e[tag=content_lock.spawn_carapacer_location,limit=1,sort=nearest] run function #content_lock:spawn/carapacer
execute as @e[tag=content_lock.spawn_carapacer_location,limit=1,sort=nearest] run kill @s
