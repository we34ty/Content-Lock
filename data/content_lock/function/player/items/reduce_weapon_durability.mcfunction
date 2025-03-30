execute store result score @s content_lock.temp2 run data get entity @s SelectedItem.components."minecraft:damage" 1000
execute store result score @s content_lock.temp3 run data get entity @s SelectedItem.components."minecraft:max_damage" 1000
execute unless score @s content_lock.temp2 matches 1.. run scoreboard players set @s content_lock.temp2 0
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2

$scoreboard players set @s content_lock.temp2 $(damage)
scoreboard players set @s content_lock.temp1 1000
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1

scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2
execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:max_damage"
scoreboard players operation @s content_lock.temp3 /= @s content_lock.temp1

execute if score @s content_lock.temp3 matches ..0 run item replace entity @s weapon.mainhand with air
execute if score @s content_lock.temp3 matches ..0 run playsound entity.item.break player @a ~ ~ ~ 1 1
scoreboard players operation @s content_lock.temp1 = @s content_lock.temp3
item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard