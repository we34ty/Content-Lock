execute if entity @e[tag=aj.wormhole.root,tag=!content_lock.wormhole] as @e[tag=aj.wormhole.root,tag=!content_lock.wormhole] at @s run function content_lock:wormhole/spawn

execute if entity @r[tag=content_lock.load_chunk_no_gravity] as @a[tag=content_lock.load_chunk_no_gravity] at @s if loaded ~ ~ ~ run attribute @s gravity modifier remove content_lock.load_chunk_no_gravity
execute if entity @r[tag=content_lock.load_chunk_no_gravity] as @a[tag=content_lock.load_chunk_no_gravity] at @s if loaded ~ ~ ~ run tag @s remove content_lock.load_chunk_no_gravity

execute at @a if entity @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] at @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] if block ~ ~-1 ~ #air run setblock ~ ~-1 ~ warped_nylium destroy
execute at @a if entity @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] at @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] unless block ~ ~ ~ #air run setblock ~ ~ ~ air destroy
execute at @a if entity @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] at @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] unless block ~ ~1 ~ #air run setblock ~ ~1 ~ air destroy
execute at @a if entity @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] as @e[tag=aj.wormhole.root,tag=!content_lock.wormhole.checked_for_blocks,distance=..40] run tag @s add content_lock.wormhole.checked_for_blocks

execute at @a if entity @e[tag=content_lock.wormhole.remover,distance=..40] at @e[tag=content_lock.wormhole.remover,distance=..40] as @e[tag=aj.wormhole.root,distance=..1] run function animated_java:wormhole/remove/this
execute at @a if entity @e[tag=content_lock.wormhole.remover,distance=..40] run kill @e[tag=content_lock.wormhole.remover,distance=..40] 

execute if entity @e[tag=content_lock.wormhole.open] at @a as @e[tag=aj.wormhole.root,distance=1.51..40,tag=content_lock.wormhole.open] run function content_lock:wormhole/close
execute at @a if entity @e[tag=aj.wormhole.root,distance=..1.5,tag=!content_lock.wormhole.open] as @e[tag=aj.wormhole.root,distance=..1.5,tag=!content_lock.wormhole.open] run function content_lock:wormhole/open

execute as @a[scores={content_lock.sneak_time_counter=1..}] at @s if entity @e[tag=content_lock.wormhole,distance=..1.5] run function content_lock:wormhole/teleport