execute rotated as @p facing entity @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target] eyes run rotate @s ~ ~

execute rotated as @p facing entity @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.4 run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.motion_saved_boss"],Radius:0.0f}
execute rotated as @p facing entity @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target] eyes store result score @s content_lock.temp1 positioned ^ ^ ^1.4 run data get entity @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

execute rotated as @p facing entity @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target] eyes store result score @s content_lock.temp1 positioned ^ ^ ^1.4 run data get entity @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[1] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[1] double 0.01 run scoreboard players get @s content_lock.temp1

execute rotated as @p facing entity @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target] eyes store result score @s content_lock.temp1 positioned ^ ^ ^1.4 run data get entity @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

execute rotated as @p facing entity @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target] eyes positioned ^ ^ ^1.4 run kill @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest]
