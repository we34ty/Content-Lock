playsound entity.player.burp hostile @a ~ ~ ~ 1 0.7
item replace entity @s weapon.mainhand with minecraft:air

execute store result score @s content_lock.temp1 run attribute @s max_health get 250
execute store result score @s content_lock.temp2 run data get entity @s Health 1000
scoreboard players operation @s content_lock.temp2 += @s content_lock.temp1
execute store result entity @s Health float 1 run scoreboard players get @s content_lock.temp2