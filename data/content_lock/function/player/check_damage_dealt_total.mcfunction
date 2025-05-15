scoreboard players set @s content_lock.damage_amount_for_check 0
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.check_for_damage_dealt
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.damage_dealt_resisted
scoreboard players operation @s content_lock.damage_amount_for_check += @s content_lock.damage_dealt_to_absorption

#execute if score @s content_lock.check_for_damage_dealt matches 1.. run function content_lock:player/effects/frostbite_calulate

scoreboard players set @s content_lock.check_for_damage_dealt 0
scoreboard players set @s content_lock.damage_dealt_resisted 0
scoreboard players set @s content_lock.damage_dealt_to_absorption 0

execute unless score @s content_lock.damage_amount_for_check matches 1.. run return 0

execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:max_damage" 1
execute store result score @s content_lock.durability run data get entity @s SelectedItem.components."minecraft:max_damage" 1000
execute store result score @s content_lock.durability_reversed run data get entity @s SelectedItem.components.minecraft:damage 1000
scoreboard players operation @s content_lock.durability -= @s content_lock.durability_reversed
scoreboard players operation @s content_lock.durability /= @s content_lock.temp1
scoreboard players operation @s content_lock.durability_reversed /= @s content_lock.temp1
