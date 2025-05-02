$xp set @s $(value) $(type)
execute store result score @s content_lock.xp_point run xp query @s points
execute store result score @s content_lock.xp_level run xp query @s levels