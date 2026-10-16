execute store result score @s content_lock.temp1 run data get entity @s Item.count
execute store result score @s content_lock.temp2 run data get entity @n equipment.offhand.count
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2
scoreboard players set @s content_lock.temp2 64
scoreboard players operation @s content_lock.temp1 < @s content_lock.temp2

data modify entity @n equipment.offhand set from entity @s Item
execute store result entity @n equipment.offhand.count int 1 run scoreboard players get @s content_lock.temp1
kill @s

playsound entity.item.pickup hostile @a ~ ~ ~ 1 1