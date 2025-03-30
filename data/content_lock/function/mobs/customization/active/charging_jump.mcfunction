tag @a remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target
execute store result score @s content_lock.temp1 at @s run data get entity @s Pos[1]
execute store result score @s content_lock.temp2 at @s run data get entity @p[tag=content_lock.im_a_target] Pos[1]
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:10}
execute if entity @r[tag=content_lock.im_a_target,distance=..5] if score @s content_lock.temp2 matches 2.. if score @s content_lock.temp1 matches 1 run data merge entity @s {Motion:[0.0d,0.75d,0.0d]}
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:100}
execute unless entity @r[tag=content_lock.im_a_target] if score @s content_lock.temp2 matches 2.. if score @s content_lock.temp1 matches 1 run data merge entity @s {Motion:[0.0d,0.75d,0.0d]}
tag @a remove content_lock.im_a_target
