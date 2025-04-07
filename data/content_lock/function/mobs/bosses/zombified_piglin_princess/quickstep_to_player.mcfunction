execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=1}] run playsound minecraft:entity.zombified_piglin.angry hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={attack_timer=5}] run playsound minecraft:entity.zombified_piglin.angry hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={attack_timer=1}] run particle minecraft:electric_spark ~ ~ ~ 0.3 1 0.3 1 100 force @a
execute if entity @s[scores={attack_timer=16..21}] run tp @s ^ ^ ^1.2
execute if entity @s[scores={attack_timer=16..21}] run damage @p[distance=0..1] 14 fly_into_wall by @s
execute if entity @s[scores={attack_timer=22}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=22}] run playsound minecraft:entity.zombified_piglin.angry hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={attack_timer=27}] run playsound minecraft:entity.zombified_piglin.angry hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={attack_timer=22}] run particle minecraft:electric_spark ~ ~ ~ 0.3 1 0.3 1 100 force @a
execute if entity @s[scores={attack_timer=37..42}] run tp @s ^ ^ ^1.2
execute if entity @s[scores={attack_timer=37..42}] run damage @p[distance=0..1] 14 fly_into_wall by @s
execute if entity @s[scores={attack_timer=43}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=43}] run tag @s remove quickstep_to_player