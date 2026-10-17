attribute @s armor modifier add content_lock.customized_content_lock 1 add_multiplied_total
attribute @s[type=!wither_skeleton] max_health modifier add content_lock.customized_content_lock -0.5 add_multiplied_total
attribute @s[type=wither_skeleton] attack_damage modifier add content_lock.customized_content_lock 0.15 add_multiplied_total
attribute @s fall_damage_multiplier modifier add content_lock.customized_content_lock 0.5 add_multiplied_total
attribute @s burning_time modifier add content_lock.customized_content_lock -0.5 add_multiplied_total
attribute @s knockback_resistance modifier add content_lock.customized_content_lock 0.5 add_value
attribute @s movement_speed modifier add content_lock.customized_content_lock 0.2 add_multiplied_base
item replace entity @s armor.feet with air
item replace entity @s armor.legs with air
tag @s add content_lock.can_be_raised_from_ground