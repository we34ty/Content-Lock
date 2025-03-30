execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:20}

tag @a remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute if score @s content_lock.temp1 matches 1 at @s if entity @p[tag=content_lock.im_a_target,distance=4..10] run function content_lock:mobs/customization/active/cast_fireball

tag @a remove content_lock.im_a_target