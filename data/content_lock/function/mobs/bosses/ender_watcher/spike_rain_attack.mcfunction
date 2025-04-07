execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
summon area_effect_cloud ~ ~ ~ {Duration:23,Tags:[ender_watcher_spike_rain]}
execute as @e[tag=ender_watcher_spike_rain,limit=1,sort=nearest] run spreadplayers ~ ~ 0 20 false @s
summon area_effect_cloud ~ ~ ~ {Duration:23,Tags:[ender_watcher_spike_rain]}
execute as @e[tag=ender_watcher_spike_rain,limit=1,sort=nearest] run spreadplayers ~ ~ 0 20 false @s
execute if entity @s[scores={attack_timer=100}] run tag @s remove spike_rain_attack