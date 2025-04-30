advancement revoke @s only content_lock:checks/entity_hurt_player

scoreboard players operation @s content_lock.health_percentage_old = @s content_lock.health_percentage
execute store result score @s content_lock.temp1 run attribute @s max_health get
execute store result score @s content_lock.health_percentage run data get entity @s Health 100
scoreboard players operation @s content_lock.health_percentage /= @s content_lock.temp1

scoreboard players operation @s content_lock.temp2 = @s content_lock.health_percentage_old
scoreboard players operation @s content_lock.temp2 -= @s content_lock.health_percentage
execute if score @s content_lock.temp2 matches ..0 run return 0

#scoreboard players set @s content_lock.temp1 3
#scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1
#scoreboard players set @s content_lock.temp1 2
#scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1

execute if score L content_lock.options.player.bleed matches 1 run scoreboard players operation @s content_lock.bleed_stacks += @s content_lock.temp2