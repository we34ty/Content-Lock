tag @a remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute at @s if entity @s[nbt={ignited:1b}] run function content_lock:mobs/customization/active/dash_at_player
execute at @s if entity @p[tag=content_lock.im_a_target,distance=0..4] if entity @s[nbt={ignited:0b}] run data merge entity @s {ignited:1b}

tag @a remove content_lock.im_a_target

