execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:100}

tag @a remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target
execute if entity @r[tag=content_lock.im_a_target] run return 0
tag @a remove content_lock.im_a_target

execute if score @s content_lock.temp1 matches 1 at @s at @p unless block ~ ~-2 ~ #walkable unless block ~ ~2 ~ #walkable unless block ~ ~-1 ~ #walkable unless block ~1 ~ ~ #walkable unless block ~-1 ~ ~ #walkable if predicate content_lock:true_dark at @s run function content_lock:mobs/customization/active/raising_from_ground_action
execute if score @s content_lock.temp1 matches 1 at @s at @p unless block ~ ~-2 ~ #walkable unless block ~ ~2 ~ #walkable unless block ~ ~-1 ~ #walkable unless block ~ ~ ~1 #walkable unless block ~ ~ ~-1 #walkable if predicate content_lock:true_dark at @s run function content_lock:mobs/customization/active/raising_from_ground_action
execute if score @s content_lock.temp1 matches 1 at @s at @p unless block ~ ~-2 ~ #walkable if predicate content_lock:so_real_for_dark at @s run function content_lock:mobs/customization/active/raising_from_ground_action