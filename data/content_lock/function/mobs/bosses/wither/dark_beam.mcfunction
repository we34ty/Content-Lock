execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1

execute if entity @s[scores={attack_timer=1..30}] as @a[distance=9.1..40] facing entity @s eyes positioned ^ ^ ^2 run particle electric_spark ~ ~2 ~ 0.2 0.2 0.2 0.1 20 force @a
execute if entity @s[scores={attack_timer=30}] run summon area_effect_cloud ~ ~2 ~ {Tags:[wither_dark_beam_center],Duration:60}

execute if entity @s[scores={attack_timer=30}] run tag @s remove dark_beam


