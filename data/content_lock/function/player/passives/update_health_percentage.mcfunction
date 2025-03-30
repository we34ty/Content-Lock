execute store result score @s content_lock.temp1 run attribute @s max_health get
execute store result score @s content_lock.health_percentage run data get entity @s Health 100
scoreboard players operation @s content_lock.health_percentage /= @s content_lock.temp1

scoreboard players add @s content_lock.bleed_stacks 8
execute if score @s content_lock.corruption_meter matches 1.. run scoreboard players add @s content_lock.bleed_stacks 5
advancement revoke @s only content_lock:checks/entity_hurt_player