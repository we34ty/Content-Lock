scoreboard players operation @s content_lock.temp1 = @s content_lock.check_for_damage_dealt
scoreboard players set @s content_lock.temp2 1
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2
scoreboard players operation @s content_lock.frostbite_stacks += @s content_lock.temp1