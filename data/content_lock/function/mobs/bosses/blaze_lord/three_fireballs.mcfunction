execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run summon area_effect_cloud ~ ~2 ~ {Duration:100,Tags:[blaze_lord_fireball]}
execute if entity @s[scores={attack_timer=1}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=31}] run summon area_effect_cloud ~ ~2 ~ {Duration:100,Tags:[blaze_lord_fireball]}
execute if entity @s[scores={attack_timer=31}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=61}] run summon area_effect_cloud ~ ~2 ~ {Duration:100,Tags:[blaze_lord_fireball]}
execute if entity @s[scores={attack_timer=61}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=61}] run tag @s remove three_fireballs