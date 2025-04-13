execute at @s facing entity @p[tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.1 run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.dash_to_player_point]}
execute at @s store result score @s content_lock.temp1 facing entity @p[tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.1 run data get entity @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

execute at @s store result score @s content_lock.temp1 facing entity @p[tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.1 run data get entity @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest] Pos[1] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[1] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
#scoreboard players add @s content_lock.temp1 100
execute store result entity @s Motion[1] double 0.01 run scoreboard players get @s content_lock.temp1

execute at @s store result score @s content_lock.temp1 facing entity @p[tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.1 run data get entity @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

execute at @s facing entity @p[tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.1 run kill @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest]

execute if entity @s[type=creeper] run tag @s add content_lock.dashed_already