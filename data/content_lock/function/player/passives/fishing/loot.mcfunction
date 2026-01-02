execute facing entity @p[tag=content_lock.fishing.hooked_tag] eyes positioned ^ ^ ^1 run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.fishing.loot_motion"],custom_particle:{type:"block",block_state:"air"},Duration:0}
execute store result score @s content_lock.temp1 positioned ^ ^ ^1 run data get entity @e[tag=content_lock.fishing.loot_motion,limit=1,sort=nearest] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

execute store result score @s content_lock.temp1 positioned ^ ^ ^1 run data get entity @e[tag=content_lock.fishing.loot_motion,limit=1,sort=nearest] Pos[1] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[1] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[1] double 0.015 run scoreboard players get @s content_lock.temp1

execute store result score @s content_lock.temp1 positioned ^ ^ ^1 run data get entity @e[tag=content_lock.fishing.loot_motion,limit=1,sort=nearest] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

execute positioned ^ ^ ^1 run kill @e[tag=content_lock.fishing.loot_motion,limit=1,sort=nearest]
