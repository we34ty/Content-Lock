execute at @s store result score @s content_lock.temp1 run data get entity @p Pos[1]
scoreboard players set @s content_lock.temp2 7
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
execute store result entity @s anchor_pos[1] int 1 run scoreboard players get @s content_lock.temp1

