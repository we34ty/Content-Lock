#execute if score @s content_lock.wither_regen matches 11.. run scoreboard players set @s content_lock.wither_regen 10

scoreboard players operation @s content_lock.temp2 = @s content_lock.wither_regen
scoreboard players set @s content_lock.temp1 100
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1

execute store result score @s content_lock.temp1 run data get entity @s Health 10000
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2

execute store result entity @s Health float 0.0001 run scoreboard players get @s content_lock.temp1