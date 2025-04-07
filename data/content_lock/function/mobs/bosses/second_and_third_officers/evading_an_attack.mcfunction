execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s timer1 199 
execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1..19}] run particle flame ~ ~1 ~ 1 1 1 0 5 force @a
execute if entity @s[scores={attack_timer=1}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={attack_timer=20..39}] run particle flame ~ ~1 ~ 1 1 1 0.1 7 force @a
execute if entity @s[scores={attack_timer=20}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 1 0.9
execute if entity @s[scores={attack_timer=40..59}] run particle flame ~ ~1 ~ 1 1 1 0.3 10 force @a
execute if entity @s[scores={attack_timer=40}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=60}] run playsound entity.generic.explode hostile @a ~ ~ ~ 2 1.2
execute if entity @s[scores={attack_timer=60}] as @a[distance=0..10] run damage @s 30 explosion
execute if entity @s[scores={attack_timer=60}] run particle flame ~ ~1 ~ 7 7 7 0.5 400 force @a
execute if entity @s[scores={attack_timer=60..}] positioned ~ ~6 ~ facing entity @p eyes positioned ~ ~-6 ~ if block ^ ^ ^-0.2 #walkable run tp @s ^ ^ ^-0.2 ~ ~
execute if entity @s[scores={attack_timer=99..}] run tag @s remove evading_an_attack