scoreboard players set @s cavalry_counter 10
attribute @s attack_damage modifier add cavalry 1 add_multiplied_total
attribute @s entity_interaction_range modifier add cavalry 1.5 add_multiplied_total
attribute @s attack_knockback modifier add cavalry 2 add_value
particle dust{color:16777215,scale:0.5} ~ ~-1 ~ 2 3 2 1 2 normal @a