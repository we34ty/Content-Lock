scoreboard players remove @s content_lock.crashful_counter 1

execute unless score @s content_lock.crashful_counter matches 0 run return 0

attribute @s attack_damage modifier remove content_lock.crashful
attribute @s entity_interaction_range modifier remove content_lock.crashful
attribute @s movement_speed modifier remove content_lock.crashful
attribute @s jump_strength modifier remove content_lock.crashful
