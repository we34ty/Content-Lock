execute facing entity @p eyes run rotate @s ~180 0

execute store result score @s content_lock.temp1 run data get entity @s Rotation[0]

execute if score @s content_lock.temp1 matches 0..45 run rotate @n[tag=content_lock.duplicator.display] 0 0
execute if score @s content_lock.temp1 matches 315..360 run rotate @n[tag=content_lock.duplicator.display] 0 0
execute if score @s content_lock.temp1 matches 45..135 run rotate @n[tag=content_lock.duplicator.display] 90 0
execute if score @s content_lock.temp1 matches 135..225 run rotate @n[tag=content_lock.duplicator.display] 180 0
execute if score @s content_lock.temp1 matches 225..315 run rotate @n[tag=content_lock.duplicator.display] 270 0