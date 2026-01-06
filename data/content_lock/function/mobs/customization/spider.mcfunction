execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
attribute @s[scores={content_lock.temp1=1}] scale modifier add content_lock.customized_content_lock -0.25 add_multiplied_base
attribute @s[scores={content_lock.temp1=1}] attack_damage modifier add content_lock.customized_content_lock -0.25 add_multiplied_base
attribute @s[scores={content_lock.temp1=1}] max_health modifier add content_lock.customized_content_lock -0.4 add_multiplied_total
attribute @s[scores={content_lock.temp1=1}] movement_speed modifier add content_lock.customized_content_lock 0.35 add_multiplied_total
attribute @s[scores={content_lock.temp1=2}] scale modifier add content_lock.customized_content_lock -0.5 add_multiplied_base
attribute @s[scores={content_lock.temp1=2}] attack_damage modifier add content_lock.customized_content_lock -0.5 add_multiplied_base
attribute @s[scores={content_lock.temp1=2}] max_health modifier add content_lock.customized_content_lock -0.5 add_multiplied_total
attribute @s[scores={content_lock.temp1=2}] movement_speed modifier add content_lock.customized_content_lock 0.45 add_multiplied_total
execute if score L content_lock.nights_skipped_in_a_row matches 6.. if score @s content_lock.temp1 matches 3 run summon phantom
execute if score L content_lock.nights_skipped_in_a_row matches 6.. if score @s content_lock.temp1 matches 3 run return run function content_lock:mobs/bosses/boss_despawn


attribute @s[scores={content_lock.temp1=3}] max_health modifier add content_lock.customized_content_lock -0.3 add_multiplied_total
attribute @s[scores={content_lock.temp1=3}] movement_speed modifier add content_lock.customized_content_lock 0.25 add_multiplied_total
attribute @s movement_efficiency modifier add content_lock.customized_content_lock 1 add_value
attribute @s fall_damage_multiplier modifier add content_lock.customized_content_lock -1 add_multiplied_total
attribute @s knockback_resistance modifier add content_lock.customized_content_lock -1 add_multiplied_total

tag @s add content_lock.can_dash_at_player
tag @s add content_lock.can_throw_cobweb

