scoreboard players add @s content_lock.temp1 1
execute positioned ~-3 ~-3 ~-3 as @e[type=!#entities,tag=!content_lock.not_influenced_by_eye,dx=6,dy=6,dz=6] run effect give @s glowing 5 0 false
particle glow ~ ~ ~ 2 2 2 1 10 force @a

execute if score @s content_lock.temp1 matches ..40 positioned ^ ^ ^1 run function content_lock:player/items/special/riders_eye_raycast