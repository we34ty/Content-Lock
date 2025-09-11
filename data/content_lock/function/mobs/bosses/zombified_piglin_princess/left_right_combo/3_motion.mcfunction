$execute facing entity @e[tag=content_lock.zombified_piglin_princess.left_right_combo.3.area,limit=1,sort=nearest] feet rotated ~ 0 positioned ^ ^ ^$(boss_speed) run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.motion_saved_boss"],Radius:0.0f}
$execute facing entity @e[tag=content_lock.zombified_piglin_princess.left_right_combo.3.area,limit=1,sort=nearest] feet rotated ~ 0 store result score @s content_lock.temp1 positioned ^ ^ ^$(boss_speed) run data get entity @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @e[tag=content_lock.zombified_piglin_princess.left_right_combo.3.area,limit=1,sort=nearest] feet rotated ~ 0 store result score @s content_lock.temp1 positioned ^ ^ ^$(boss_speed) run data get entity @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @e[tag=content_lock.zombified_piglin_princess.left_right_combo.3.area,limit=1,sort=nearest] feet rotated ~ 0 positioned ^ ^ ^$(boss_speed) run kill @e[tag=content_lock.motion_saved_boss,limit=1,sort=nearest]
