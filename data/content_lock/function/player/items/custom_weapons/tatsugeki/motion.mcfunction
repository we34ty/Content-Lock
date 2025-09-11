$execute facing entity @e[tag=content_lock.tatsugeki.dolphin.area,limit=1,sort=nearest] feet positioned ^ ^ ^$(speed) run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.motion_saved_dolphin"],Radius:0.0f}
$execute facing entity @e[tag=content_lock.tatsugeki.dolphin.area,limit=1,sort=nearest] feet store result score @s content_lock.temp1 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.motion_saved_dolphin,limit=1,sort=nearest] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @e[tag=content_lock.tatsugeki.dolphin.area,limit=1,sort=nearest] feet store result score @s content_lock.temp1 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.motion_saved_dolphin,limit=1,sort=nearest] Pos[1] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[1] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[1] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @e[tag=content_lock.tatsugeki.dolphin.area,limit=1,sort=nearest] feet store result score @s content_lock.temp1 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.motion_saved_dolphin,limit=1,sort=nearest] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @e[tag=content_lock.tatsugeki.dolphin.area,limit=1,sort=nearest] feet positioned ^ ^ ^$(speed) run kill @e[tag=content_lock.motion_saved_dolphin,limit=1,sort=nearest]
