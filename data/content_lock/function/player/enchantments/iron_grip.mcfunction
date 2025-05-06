execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:enchantments".levels."content_lock:iron_grip"

execute if score @s content_lock.temp1 matches 1 run attribute @s attack_damage modifier add content_lock.iron_grip 0.15 add_multiplied_base
execute if score @s content_lock.temp1 matches 1 run attribute @s entity_interaction_range modifier add content_lock.iron_grip 0.1 add_multiplied_base
execute if score @s content_lock.temp1 matches 1 run attribute @s attack_knockback modifier add content_lock.iron_grip 0.2 add_value
execute if score @s content_lock.temp1 matches 1 run attribute @s attack_speed modifier add content_lock.iron_grip -0.07 add_multiplied_base

execute if score @s content_lock.temp1 matches 2 run attribute @s attack_damage modifier add content_lock.iron_grip 0.25 add_multiplied_base
execute if score @s content_lock.temp1 matches 2 run attribute @s entity_interaction_range modifier add content_lock.iron_grip 0.2 add_multiplied_base
execute if score @s content_lock.temp1 matches 2 run attribute @s attack_knockback modifier add content_lock.iron_grip 0.35 add_value
execute if score @s content_lock.temp1 matches 2 run attribute @s attack_speed modifier add content_lock.iron_grip -0.14 add_multiplied_base

execute if score @s content_lock.temp1 matches 3.. run attribute @s attack_damage modifier add content_lock.iron_grip 0.35 add_multiplied_base
execute if score @s content_lock.temp1 matches 3.. run attribute @s entity_interaction_range modifier add content_lock.iron_grip 0.3 add_multiplied_base
execute if score @s content_lock.temp1 matches 3.. run attribute @s attack_knockback modifier add content_lock.iron_grip 0.5 add_value
execute if score @s content_lock.temp1 matches 3.. run attribute @s attack_speed modifier add content_lock.iron_grip -0.21 add_multiplied_base

tag @s add content_lock.iron_grip