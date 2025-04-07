execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run playsound minecraft:entity.blaze.ambient hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1..}] run particle dust{color:[0.878, 0.345, 0.133],scale: 1} ~ ~ ~ 3 0 3 1 30 force @a
execute if entity @s[scores={attack_timer=1..}] run particle dust{color:[0.0, 0.067, 1.0],scale: 1} ~ ~ ~ 0 3 0 1 5 force @a
execute if entity @s[scores={attack_timer=60..}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=60..}] run summon zombified_piglin ~ ~ ~ {Glowing:1b, Tags:[zombified_piglin_defense]}
execute if entity @s[scores={attack_timer=60..}] run tag @s remove spawning_defensive_zombie