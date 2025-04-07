execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run scoreboard players set @s timer1 0
execute if entity @s[scores={attack_timer=1..,timer1=10..}] run scoreboard players set @s timer1 0
execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s timer1 1

execute if entity @s[scores={attack_timer=1..,timer1=10..}] as @a[distance=0..9] run summon area_effect_cloud ~ ~ ~ {Duration:10,Tags:[wither_cursed_ground]}
execute if entity @s[scores={attack_timer=1..,timer1=10..}] run spreadplayers ~ ~ 1 9 false @e[tag=wither_cursed_ground,distance=0..1]

execute if entity @s[scores={attack_timer=52}] run tag @s remove cursed_ground


