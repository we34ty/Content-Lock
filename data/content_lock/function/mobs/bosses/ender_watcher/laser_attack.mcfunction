execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute at @p run summon area_effect_cloud ~ ~ ~ {Duration:10,Tags:[ender_watcher_laser_target]}
execute if entity @s[scores={attack_timer=10..}] run summon area_effect_cloud ~ ~0.4 ~ {Tags:[ender_watcher_laser_beam],CustomName:'[{"text":"Ender Watcher Laser Beam","color":"light_purple"}]'}
execute if entity @s[scores={attack_timer=10..}] as @e[tag=ender_watcher_laser_beam,limit=1,sort=nearest] at @s facing entity @e[tag=ender_watcher_laser_target,limit=1,nbt={Age:9}] feet run tp @s ~ ~ ~ ~ ~


execute if entity @s[scores={attack_timer=100}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=100}] run tag @s remove laser_attack