$execute store result score @s content_lock.temp1 run data get entity @s Inventory[{Slot:$(value)b}].components."minecraft:damage"

scoreboard players set @s content_lock.temp2 -2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add

scoreboard players set @s content_lock.temp1 1000
$execute run item modify entity @s container.$(value) content_lock:durability_from_scoreboard

playsound minecraft:item.content_lock.silver_tape player @a ~ ~ ~ 1 1