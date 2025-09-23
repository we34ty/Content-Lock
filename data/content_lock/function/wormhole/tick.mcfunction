execute if entity @e[tag=aj.wormhole.root,tag=!content_lock.wormhole] as @e[tag=aj.wormhole.root,tag=!content_lock.wormhole] at @s run function content_lock:wormhole/spawn

execute if entity @e[tag=content_lock.wormhole.open] at @a as @e[tag=aj.wormhole.root,distance=1.51..40,tag=content_lock.wormhole.open] run function content_lock:wormhole/close
execute at @a if entity @e[tag=aj.wormhole.root,distance=..1.5,tag=!content_lock.wormhole.open] as @e[tag=aj.wormhole.root,distance=..1.5,tag=!content_lock.wormhole.open] run function content_lock:wormhole/open

execute at @a if entity @e[tag=aj.wormhole.root,distance=1.51..40] at @e[tag=aj.wormhole.root,distance=1.51..40] if block ~ ~-1 ~ #air run setblock ~ ~-1 ~ warped_nylium
execute at @a if entity @e[tag=aj.wormhole.root,distance=1.51..40] at @e[tag=aj.wormhole.root,distance=1.51..40] unless block ~ ~ ~ #air run setblock ~ ~ ~ air

execute as @a[scores={content_lock.sneak_time_counter=1..}] at @s if entity @e[tag=content_lock.wormhole,distance=..1.5] run function content_lock:wormhole/teleport