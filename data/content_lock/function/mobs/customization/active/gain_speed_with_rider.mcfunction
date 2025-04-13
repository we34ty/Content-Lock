tag @a remove content_lock.im_a_passanger
execute on passengers run tag @s add content_lock.im_a_passanger
attribute @s movement_speed modifier remove content_lock.gain_speed_with_rider
execute if entity @p[tag=content_lock.im_a_passanger] run attribute @s movement_speed modifier add content_lock.gain_speed_with_rider 4 add_multiplied_base
