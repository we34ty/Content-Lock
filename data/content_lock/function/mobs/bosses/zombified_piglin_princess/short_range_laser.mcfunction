execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] run playsound minecraft:entity.zombified_piglin.death hostile @s ~ ~ ~ 2 0.5
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=1..16}] positioned ~ ~1.3 ~ run particle flame ^ ^ ^0.6 0 0 0 0.1 10 force @a
execute if entity @s[scores={attack_timer=17..27}] run summon armor_stand ~ ~1.3 ~ {Invisible:1b,Small:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:[zombified_piglin_princess_laser]}
execute if entity @s[scores={attack_timer=30}] run playsound minecraft:entity.zombified_piglin.death hostile @s ~ ~ ~ 2 0.5
execute if entity @s[scores={attack_timer=30}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=30..47}] positioned ~ ~1.3 ~ run particle flame ^ ^ ^0.6 0 0 0 0.1 10 force @a
execute if entity @s[scores={attack_timer=58..68}] run summon armor_stand ~ ~1.3 ~ {Invisible:1b,Small:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:[zombified_piglin_princess_laser]}
execute if entity @s[scores={attack_timer=69}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=69}] run tag @s remove short_range_laser