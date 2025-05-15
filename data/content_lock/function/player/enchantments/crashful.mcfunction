scoreboard players add @s content_lock.crashful_counter 2
attribute @s attack_damage modifier add content_lock.crashful -1 add_multiplied_total
attribute @s entity_interaction_range modifier add content_lock.crashful -1 add_multiplied_total
attribute @s movement_speed modifier add content_lock.crashful -1 add_multiplied_total
attribute @s jump_strength modifier add content_lock.crashful -1 add_multiplied_total

playsound minecraft:block.anvil.land ambient @a ~ ~ ~ 0.3 0.6