execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] run tp @s ~ ~ ~ ~ 180
execute if entity @s[scores={attack_timer=1}] run playsound minecraft:entity.piglin.converted_to_zombified hostile @a ~ ~ ~ 2 1.3
execute if entity @s[scores={attack_timer=1}] run particle dust{color:[1, 0, 0],scale: 1} ~ ~ ~ 5 0 5 0 300 force @a
execute if entity @s[scores={attack_timer=20}] run playsound minecraft:entity.piglin.converted_to_zombified hostile @a ~ ~ ~ 2 1.3
execute if entity @s[scores={attack_timer=20}] run particle dust{color:[1, 0, 0],scale: 1} ~ ~ ~ 5 0 5 0 300 force @a
execute if entity @s[scores={attack_timer=40..80}] run particle flame ~ ~ ~ 4 8 4 0 400 force @a
execute if entity @s[scores={attack_timer=40..80}] as @a[distance=0..5] run damage @s 30 in_fire by @e[tag=zombified_piglin_princess,limit=1]
execute if entity @s[scores={attack_timer=81}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=81}] run tag @s remove fire_gay