playsound entity.player.burp hostile @a ~ ~ ~ 1 0.7
item replace entity @s weapon.mainhand with minecraft:air
execute store result entity @s Health float 1 run attribute @s max_health get