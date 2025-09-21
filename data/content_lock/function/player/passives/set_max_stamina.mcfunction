#minimum value of max stamina
scoreboard players set @s content_lock.max_stamina 100

#basically getting 1-(movement efficiency)
execute store result score @s content_lock.temp1 run attribute @s movement_efficiency get 100000
scoreboard players set @s content_lock.temp2 100000
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1

#giving player said reversed movement efficiency for each equip load level
scoreboard players operation @s content_lock.temp1 = @s content_lock.eqld_from_level
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

scoreboard players operation @s content_lock.max_stamina += @s content_lock.temp1

scoreboard players operation @s content_lock.temp1 = @s content_lock.eqld_from_level
scoreboard players set @s content_lock.temp2 20
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

scoreboard players operation @s content_lock.max_stamina += @s content_lock.temp1


#the delay also uses a similiar system where having less movement efficiency gives shorter delay
execute store result score @s content_lock.temp1 run attribute @s movement_efficiency get 100
scoreboard players set @s content_lock.temp2 100
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1

scoreboard players set @s content_lock.stamina_delay 100
scoreboard players operation @s content_lock.stamina_delay -= @s content_lock.temp2
scoreboard players set @s[scores={content_lock.stamina_delay=..-1}] content_lock.stamina_delay 0


#stamina regen calculations
scoreboard players operation @s content_lock.stamina_regen = sprint.stamina.restoration lsp.Values
scoreboard players set @s content_lock.temp1 1000
scoreboard players operation @s content_lock.temp2 = @s content_lock.max_stamina
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
scoreboard players operation @s content_lock.stamina_regen += @s content_lock.temp2