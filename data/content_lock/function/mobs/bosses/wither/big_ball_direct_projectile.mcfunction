execute unless score @s content_lock.timer2 matches 2.. run particle dust{color:4276551,scale:3} ~ ~ ~ 2 2 2 1 80 force @a
execute unless score @s content_lock.timer2 matches 2.. run particle soul ~ ~ ~ 3 3 3 0.2 25 normal @a
execute unless score @s content_lock.timer2 matches 2.. run particle soul_fire_flame ~ ~ ~ 3 3 3 0.2 36 normal @a
playsound block.fire.ambient hostile @a ~ ~ ~ 1 1

execute unless score @s content_lock.timer2 matches 2.. facing entity @n[tag=content_lock.wither.big_ball_direct.enemy_pointer] feet run tp @s ^ ^ ^0.4

execute if entity @n[tag=content_lock.wither.big_ball_direct.enemy_pointer,distance=..0.6] unless score @s content_lock.timer2 matches 2.. run scoreboard players set @s content_lock.timer2 80

execute if score @s content_lock.timer2 matches 3.. run particle enchanted_hit ~ ~ ~ 15 15 15 0 50 normal @a
execute if score @s content_lock.timer2 matches 60.. run particle portal ~ ~ ~ 0 0 0 1 30 normal @a
execute if score @s content_lock.timer2 matches 3..59 run particle dust{color:4276551,scale:3} ~ ~ ~ 0 0 0 1 20 force @a
execute if score @s content_lock.timer2 matches 3..59 run particle soul ~ ~ ~ 0 0 0 0.1 20 force @a
execute if score @s content_lock.timer2 matches 80 run playsound entity.wither.death hostile @a ~ ~ ~ 4 1

execute if score @s content_lock.timer2 matches 10 run particle explosion ~ ~ ~ 15 15 15 1 100 normal @a
execute if score @s content_lock.timer2 matches 7 run particle explosion ~ ~ ~ 15 15 15 1 100 normal @a
execute if score @s content_lock.timer2 matches 4 run particle explosion ~ ~ ~ 15 15 15 1 100 normal @a
execute if score @s content_lock.timer2 matches 2 run particle explosion ~ ~ ~ 15 15 15 1 100 force @a
execute if score @s content_lock.timer2 matches 2 run particle soul ~ ~ ~ 0 0 0 1 100 force @a
execute if score @s content_lock.timer2 matches 2 run particle soul_fire_flame ~ ~ ~ 0 0 0 1 100 normal @a
execute if score @s content_lock.timer2 matches 20 run playsound entity.wither.spawn hostile @a ~ ~ ~ 4 2
execute if score @s content_lock.timer2 matches 10 run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.3
execute if score @s content_lock.timer2 matches 7 run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.3
execute if score @s content_lock.timer2 matches 6 run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.3
execute if score @s content_lock.timer2 matches 4 run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.3
execute if score @s content_lock.timer2 matches 2 run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.3
execute if score @s content_lock.timer2 matches 10 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:15,distance:30,damage:18,damage_type:explosion}
execute if score @s content_lock.timer2 matches 2 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:15,distance:30,damage:18,damage_type:explosion}
execute if score @s content_lock.timer2 matches 2 run kill @s

execute if score @s content_lock.timer2 matches 1.. run scoreboard players remove @s content_lock.timer2 1
execute if score @s content_lock.timer2 matches 1.. run scoreboard players add @n[type=wither,scores={content_lock.attack_timer=..118}] content_lock.attack_timer 1