$execute facing entity @n[tag=content_lock.death_rider.rush_without_horse.area] feet rotated ~ 0 positioned ^ ^ ^$(boss_speed) run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.motion_saved_boss"],custom_particle:{type:"block",block_state:"air"},Duration:0}
$execute facing entity @n[tag=content_lock.death_rider.rush_without_horse.area] feet rotated ~ 0 store result score @s content_lock.temp1 positioned ^ ^ ^$(boss_speed) run data get entity @n[tag=content_lock.motion_saved_boss] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @n[tag=content_lock.death_rider.rush_without_horse.area] feet rotated ~ 0 store result score @s content_lock.temp1 positioned ^ ^ ^$(boss_speed) run data get entity @n[tag=content_lock.motion_saved_boss] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

$execute facing entity @n[tag=content_lock.death_rider.rush_without_horse.area] feet rotated ~ 0 positioned ^ ^ ^$(boss_speed) run kill @n[tag=content_lock.motion_saved_boss]
