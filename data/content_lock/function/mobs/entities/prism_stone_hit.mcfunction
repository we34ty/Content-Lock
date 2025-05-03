execute store result score @s content_lock.y_level_check run data get entity @s Pos[1]
scoreboard players operation @s content_lock.stored_y -= @s content_lock.y_level_check

execute if score @s content_lock.stored_y matches ..5 run playsound block.glass.place voice @a ~ ~ ~ 10 0.5
execute if score @s content_lock.stored_y matches 6..12 run playsound block.glass.place voice @a ~ ~ ~ 10 2
execute if score @s content_lock.stored_y matches 13..25 run playsound block.glass.break voice @a ~ ~ ~ 10 1
execute if score @s content_lock.stored_y matches 26.. run playsound entity.ghast.hurt voice @a ~ ~ ~ 10 2
execute if score @s content_lock.stored_y matches 26.. run return run kill @s

rotate @s ~ 0
tag @s add content_lock.prism_stone.fallen

