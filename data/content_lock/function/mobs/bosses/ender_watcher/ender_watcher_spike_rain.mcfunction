#execute unless entity @s[tag=started_already] run spreadplayers ~ ~ 1 30 false @s 
execute unless entity @s[tag=started_already] run summon area_effect_cloud ~ ~ ~ {Duration:21,Tags:[ender_watcher_spike_rain_indicator]}
execute unless entity @s[tag=started_already] run tp @s ~ ~20 ~
execute if entity @s[tag=started_already] run tp @s ~ ~-1 ~
execute unless entity @s[tag=started_already] run tag @s add started_already
particle minecraft:end_rod ~ ~ ~ 0 0 0 0 2 force @a
execute as @a[distance=0..1.5] run damage @s 26 magic by @e[tag=ender_watcher,limit=1]
playsound block.amethyst_block.chime hostile @a ~ ~ ~ 0.5 1