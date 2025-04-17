attribute @s movement_speed modifier add content_lock.customized_content_lock 0.2 add_multiplied_base
attribute @s max_health modifier add content_lock.customized_content_lock -0.4 add_multiplied_total
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
tag @s[scores={content_lock.temp1=1}] add content_lock.can_dash_at_player
attribute @s[scores={content_lock.temp1=1}] max_health modifier add content_lock.customized_content_lock_chance -0.5 add_multiplied_total
#data merge entity @s[scores={temp1=1}] {Fuse:20}