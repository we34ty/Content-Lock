playsound entity.player.burp hostile @a ~ ~ ~ 1 0.7

execute store result score @s content_lock.temp1 run attribute @s max_health get 250
execute store result score @s content_lock.temp2 run data get entity @s Health 1000
scoreboard players operation @s content_lock.temp2 += @s content_lock.temp1
execute store result entity @s Health float 1 run scoreboard players get @s content_lock.temp2

execute store result score @s content_lock.temp1 run data get entity @n equipment.offhand.count
scoreboard players remove @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 1.. store result entity @s equipment.offhand.count int 1 run scoreboard players get @s content_lock.temp1
execute unless score @s content_lock.temp1 matches 1.. run item replace entity @s weapon.offhand with air

scoreboard players set @s content_lock.mob.eating 0
attribute @s attack_damage modifier remove content_lock.mob.eating
attribute @s movement_speed modifier remove content_lock.mob.eating