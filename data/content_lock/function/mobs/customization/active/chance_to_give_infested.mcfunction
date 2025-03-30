execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}

tag @a remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute if score @s content_lock.temp1 matches 1 at @s if entity @p[tag=content_lock.im_a_target,nbt={HurtTime:9s}] run effect give @p[tag=content_lock.im_a_target] infested 10 0 false

tag @a remove content_lock.im_a_target