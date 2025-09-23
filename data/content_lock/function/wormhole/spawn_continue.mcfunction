function animated_java:wormhole/summon {args:{}}
tag @e[distance=..0.01,tag=aj.wormhole.root,tag=!content_lock.wormhole] add content_lock.wormhole.yet_to_be_teleported
tag @e[distance=..0.01,tag=aj.wormhole.root] add content_lock.wormhole
#tp @e[distance=..0.01,tag=aj.wormhole.root] ~ ~ ~ 0 0
execute store result score @e[tag=content_lock.wormhole.yet_to_be_teleported,limit=1,sort=nearest] content_lock.stored_x run data get entity @s Pos[0]
execute store result score @e[tag=content_lock.wormhole.yet_to_be_teleported,limit=1,sort=nearest] content_lock.stored_y run data get entity @s Pos[1]
execute store result score @e[tag=content_lock.wormhole.yet_to_be_teleported,limit=1,sort=nearest] content_lock.stored_z run data get entity @s Pos[2]

function content_lock:wormhole/set_tp_location

