function animated_java:wormhole/summon {args:{}}
execute as @e[distance=..0.01,type=item_display,tag=aj.wormhole.root,tag=!content_lock.wormhole] run data merge entity @s {CustomName:{translate:"content_lock:mob.wormhole"},CustomNameVisible:false}
tag @e[distance=..0.01,type=item_display,tag=aj.wormhole.root,tag=!content_lock.wormhole] add content_lock.wormhole.yet_to_be_teleported
tag @e[distance=..0.01,type=item_display,tag=aj.wormhole.root] add content_lock.wormhole
#tp @e[distance=..0.01,tag=aj.wormhole.root] ~ ~ ~ 0 0
execute store result score @n[tag=content_lock.wormhole.yet_to_be_teleported] content_lock.stored_x run data get entity @s Pos[0]
execute store result score @n[tag=content_lock.wormhole.yet_to_be_teleported] content_lock.stored_y run data get entity @s Pos[1]
execute store result score @n[tag=content_lock.wormhole.yet_to_be_teleported] content_lock.stored_z run data get entity @s Pos[2]

function content_lock:mobs/entities/wormhole/set_tp_location

