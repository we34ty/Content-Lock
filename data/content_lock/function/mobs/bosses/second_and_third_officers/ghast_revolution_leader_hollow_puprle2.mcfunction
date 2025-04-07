particle flame ~ ~ ~ 0.1 0.1 0.1 0.03 10 force @a
scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1..}] facing entity @e[tag=ghast_revolution_leader_hollow_puprle1,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.08
execute if entity @s[scores={attack_timer=41..}] run kill @s