execute if items block ~ ~ ~ container.4 #pickaxes run scoreboard players set @s quarry_cooldown 25

execute store result score @s quarry_temp_var run data get block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments".levels."content_lock:weapon_level"
scoreboard players operation @s quarry_temp_var *= mining_quarry_2 quarry_temp_var
scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s quarry_temp_var /= @s content_lock.temp1
scoreboard players operation @s quarry_cooldown -= @s quarry_temp_var
scoreboard players reset @s quarry_temp_var

execute unless data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments".levels."minecraft:efficiency" run return 0

execute store result score @s quarry_temp_var run data get block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments".levels."minecraft:efficiency"
scoreboard players operation @s quarry_temp_var *= mining_quarry_2 quarry_temp_var
scoreboard players operation @s quarry_cooldown -= @s quarry_temp_var
scoreboard players reset @s quarry_temp_var