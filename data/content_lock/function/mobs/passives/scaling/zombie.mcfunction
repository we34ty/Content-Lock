attribute @s movement_speed modifier add content_lock.zombie_scaled 0.2 add_multiplied_base
attribute @s spawn_reinforcements modifier add content_lock.zombie_scaled 0.5 add_value
attribute @s attack_damage modifier add content_lock.zombie_scaled 0.5 add_multiplied_base
attribute @s burning_time modifier add content_lock.zombie_scaled -0.7 add_multiplied_base
attribute @s knockback_resistance modifier add content_lock.zombie_scaled 0.3 add_value

execute unless entity @s[tag=content_lock.boss] run function content_lock:mobs/passives/random_armor