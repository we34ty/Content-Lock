item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add
execute store result score @s content_lock.temp2 run data get entity @s SelectedItem.components."minecraft:damage"
execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:max_damage"
execute if score @s content_lock.temp2 = @s content_lock.temp1 at @s run playsound entity.item.break player @a ~ ~ ~ 1 1
execute if score @s content_lock.temp2 = @s content_lock.temp1 run item replace entity @s weapon.mainhand with minecraft:air
