scoreboard players add @s content_lock.temp1 1
execute positioned ~-3 ~-3 ~-3 if entity @e[type=!#entities,tag=!content_lock.yet_to_be_telported,dx=6,dy=6,dz=6] as @e[type=!#entities,tag=!content_lock.yet_to_be_telported,dx=6,dy=6,dz=6] run return run tag @s add content_lock.im_a_target

execute if score @s content_lock.temp1 matches ..40 positioned ^ ^ ^1 run function content_lock:player/items/custom_weapons/quickstep_dagger/teleport_raycast