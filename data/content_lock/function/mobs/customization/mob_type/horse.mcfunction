#execute if entity @s[type=pig] run attribute @s movement_speed modifier add content_lock.customized_content_lock2 0.3 add_value
execute if entity @s[type=happy_ghast] run attribute @s flying_speed modifier add content_lock.customized_content_lock2 1 add_multiplied_base
execute if entity @s[type=pig] run attribute @s step_height modifier add content_lock.customized_content_lock2 1 add_value
execute if entity @s[type=strider] run attribute @s step_height modifier add content_lock.customized_content_lock2 1 add_value
attribute @s[type=!pig] movement_speed modifier add content_lock.customized_content_lock 0.5 add_multiplied_base
attribute @s safe_fall_distance modifier add content_lock.customized_content_lock 5 add_value
attribute @s step_height modifier add content_lock.customized_content_lock 1 add_value
attribute @s jump_strength modifier add content_lock.customized_content_lock 0.5 add_value
attribute @s jump_strength modifier add content_lock.customized_content_lock2 0.25 add_multiplied_total
execute if entity @s[type=strider] run attribute @s tempt_range modifier add content_lock.customized_content_lock 5 add_multiplied_total
data merge entity @s {Strength:5}
execute if entity @s[type=llama] run tag @s add content_lock.can_be_controlled_with_carrot
execute if entity @s[type=pig] run tag @s add content_lock.gain_speed_with_rider
