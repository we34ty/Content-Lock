tag @a remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
#scoreboard players set @s temp1 1
execute at @s if entity @p[tag=content_lock.im_a_target,distance=3..10] if score @s content_lock.temp1 matches 1 run function content_lock:mobs/customization/active/dash_at_player
#execute at @s if entity @p[tag=im_a_target,distance=..4] if score @s temp1 matches 1 run say lol
tag @a remove content_lock.im_a_target

