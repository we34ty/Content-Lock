particle soul_fire_flame ~ ~ ~ 0.1 0.1 0.1 0.03 10 force @a
scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=21..}] facing entity @e[tag=ghast_revolution_leader_hollow_puprle2,limit=1,sort=nearest] feet run tp @s ^ ^ ^0.08
execute if entity @s[scores={attack_timer=61..}] run summon area_effect_cloud ~ ~ ~ {Duration:100,Tags:["ghast_revolution_leader_hollow_puprle"]}
execute if entity @s[scores={attack_timer=61..}] run kill @s