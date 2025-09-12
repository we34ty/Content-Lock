tp @s ~ ~0.2 ~

execute at @s facing entity @e[type=!#entities,limit=1,sort=nearest] eyes positioned ^ ^ ^10.1 run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.dash_to_player_point],custom_particle:{type:"block",block_state:"air"},Duration:0}
execute at @s store result score @s content_lock.temp1 facing entity @e[type=!#entities,limit=1,sort=nearest] eyes positioned ^ ^ ^10.1 run data get entity @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest] Pos[0] 1000
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 1000
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.001 run scoreboard players get @s content_lock.temp1

execute at @s store result score @s content_lock.temp1 facing entity @e[type=!#entities,limit=1,sort=nearest] eyes positioned ^ ^ ^10.1 run data get entity @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest] Pos[1] 1000
execute store result score @s content_lock.temp2 run data get entity @s Pos[1] 1000
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
#scoreboard players add @s content_lock.temp1 100
execute store result entity @s Motion[1] double 0.001 run scoreboard players get @s content_lock.temp1

execute at @s store result score @s content_lock.temp1 facing entity @e[type=!#entities,limit=1,sort=nearest] eyes positioned ^ ^ ^10.1 run data get entity @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest] Pos[2] 1000
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 1000
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.001 run scoreboard players get @s content_lock.temp1

execute at @s facing entity @e[type=!#entities,limit=1,sort=nearest] eyes positioned ^ ^ ^10.1 run kill @e[tag=content_lock.dash_to_player_point,limit=1,sort=nearest]

execute unless predicate content_lock:random run tag @s remove content_lock.can_ricoshet