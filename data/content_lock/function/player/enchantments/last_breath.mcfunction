execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:enchantments".levels."content_lock:last_breath"

execute if score @s content_lock.temp1 matches 1 run attribute @s attack_damage modifier add content_lock.last_breath 0.1 add_multiplied_total
execute if score @s content_lock.temp1 matches 2 run attribute @s attack_damage modifier add content_lock.last_breath 0.15 add_multiplied_total
execute if score @s content_lock.temp1 matches 3 run attribute @s attack_damage modifier add content_lock.last_breath 0.22 add_multiplied_total
execute if score @s content_lock.temp1 matches 4 run attribute @s attack_damage modifier add content_lock.last_breath 0.3 add_multiplied_total
execute if score @s content_lock.temp1 matches 5 run attribute @s attack_damage modifier add content_lock.last_breath 0.39 add_multiplied_total
execute if score @s content_lock.temp1 matches 6 run attribute @s attack_damage modifier add content_lock.last_breath 0.52 add_multiplied_total
execute if score @s content_lock.temp1 matches 7 run attribute @s attack_damage modifier add content_lock.last_breath 0.74 add_multiplied_total
execute if score @s content_lock.temp1 matches 8.. run attribute @s attack_damage modifier add content_lock.last_breath 1 add_multiplied_total


tag @s add content_lock.last_breath