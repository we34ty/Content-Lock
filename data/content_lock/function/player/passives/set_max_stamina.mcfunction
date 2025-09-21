execute store result score @s content_lock.max_stamina run attribute @s movement_efficiency get 800
scoreboard players set @s content_lock.temp1 100
scoreboard players operation @s content_lock.max_stamina += @s content_lock.temp1

scoreboard players set @s content_lock.temp1 40
scoreboard players operation @s content_lock.temp2 = @s content_lock.eqld_from_level
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1
scoreboard players operation @s content_lock.max_stamina += @s content_lock.temp2


execute store result score @s content_lock.temp1 run attribute @s movement_efficiency get 100
scoreboard players set @s content_lock.stamina_delay 100
scoreboard players operation @s content_lock.stamina_delay -= @s content_lock.temp1
scoreboard players set @s[scores={content_lock.stamina_delay=..-1}] content_lock.stamina_delay 0