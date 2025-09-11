execute if items block ~ ~ ~ container.4 #pickaxes run scoreboard players set @s content_lock.quarry_cooldown 25

execute store result score @s content_lock.quarry_temp_var run data get block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."content_lock:weapon_level"
scoreboard players operation @s content_lock.quarry_temp_var *= mining_quarry_2 content_lock.quarry_temp_var
scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s content_lock.quarry_temp_var /= @s content_lock.temp1
scoreboard players operation @s content_lock.quarry_cooldown -= @s content_lock.quarry_temp_var
scoreboard players reset @s content_lock.quarry_temp_var

execute unless data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:efficiency" run return 0

execute store result score @s content_lock.quarry_temp_var run data get block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:efficiency"
scoreboard players operation @s content_lock.quarry_temp_var *= mining_quarry_2 content_lock.quarry_temp_var
scoreboard players operation @s content_lock.quarry_cooldown -= @s content_lock.quarry_temp_var
scoreboard players reset @s content_lock.quarry_temp_var