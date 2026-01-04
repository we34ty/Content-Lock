$scoreboard players set @s content_lock.temp1 -$(durability)
execute if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add

execute store result score @s content_lock.temp2 run data get entity @s SelectedItem.components."minecraft:damage"
execute store result score @s content_lock.temp3 run data get entity @s SelectedItem.components."minecraft:max_damage"
execute if score @s content_lock.temp2 = @s content_lock.temp3 at @s run playsound block.conduit.deactivate player @a ~ ~ ~ 0.5 2
execute if score @s content_lock.temp2 = @s content_lock.temp3 run item modify entity @s weapon.mainhand content_lock:spell_cooldown