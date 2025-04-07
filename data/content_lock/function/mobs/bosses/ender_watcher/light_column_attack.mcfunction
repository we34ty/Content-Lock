execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run summon area_effect_cloud ~ ~2 ~ {Tags:[ender_watcher_light_column_seed]}
execute if entity @s[scores={attack_timer=1}] as @e[tag=ender_watcher_light_column_seed,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=50}] run summon area_effect_cloud ~ ~2 ~ {Tags:[ender_watcher_light_column_seed]}
execute if entity @s[scores={attack_timer=50}] as @e[tag=ender_watcher_light_column_seed,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=100}] run summon area_effect_cloud ~ ~2 ~ {Tags:[ender_watcher_light_column_seed]}
execute if entity @s[scores={attack_timer=100}] as @e[tag=ender_watcher_light_column_seed,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=100}] run tag @s remove light_column_attack