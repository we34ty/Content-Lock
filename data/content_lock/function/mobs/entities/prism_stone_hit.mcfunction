execute store result score @s content_lock.temp1 run data get entity @s Pos[1]
scoreboard players operation @s content_lock.stored_y -= @s content_lock.temp1

execute if score @s content_lock.stored_y matches ..5 run playsound minecraft:item.content_lock.prism_stone.small player @a ~ ~ ~ 10 1
execute if score @s content_lock.stored_y matches 6..12 run playsound minecraft:item.content_lock.prism_stone.medium player @a ~ ~ ~ 10 1
execute if score @s content_lock.stored_y matches 13..25 run playsound minecraft:item.content_lock.prism_stone.big player @a ~ ~ ~ 10 1
execute if score @s content_lock.stored_y matches 26.. run playsound minecraft:item.content_lock.prism_stone.deadly player @a ~ ~ ~ 10 1
#execute if score @s content_lock.stored_y matches 26.. run return run kill @s

rotate @s ~ 0
tag @s add content_lock.prism_stone.fallen

execute unless block ~ ~-1 ~ #air run setblock ~ ~ ~ soul_torch destroy
execute if block ~ ~-1 ~ #air if entity @s[y_rotation=135..179.9] run setblock ~ ~ ~ soul_wall_torch[facing=south] destroy
execute if block ~ ~-1 ~ #air if entity @s[y_rotation=-180..-135.1] run setblock ~ ~ ~ soul_wall_torch[facing=south] destroy

execute if block ~ ~-1 ~ #air if entity @s[y_rotation=-135..-45.1] run setblock ~ ~ ~ soul_wall_torch[facing=west] destroy

execute if block ~ ~-1 ~ #air if entity @s[y_rotation=-45..44.9] run setblock ~ ~ ~ soul_wall_torch[facing=north] destroy

execute if block ~ ~-1 ~ #air if entity @s[y_rotation=45..134.9] run setblock ~ ~ ~ soul_wall_torch[facing=east] destroy

kill @s

