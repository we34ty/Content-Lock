execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] run tp @s ~ ~ ~ ~ -90
execute if entity @s[scores={attack_timer=1}] run playsound entity.wither.death hostile @a ~ ~ ~ 1 1.2
execute if entity @s[scores={attack_timer=1..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~1.9 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=20..}] positioned ^ ^ ^0.4 run summon area_effect_cloud ~ ~1.9 ~ {Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:[wither_skeleton_revolution_leader_tentacle],Duration:30}

execute if entity @s[scores={attack_timer=80}] run kill @e[tag=wither_skeleton_revolution_leader_tentacle]
execute if entity @s[scores={attack_timer=80}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=80}] run tag @s remove wither_tentacle_summon