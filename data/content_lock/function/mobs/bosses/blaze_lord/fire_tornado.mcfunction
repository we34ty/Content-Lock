execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1 ~ run particle flame ^ ^ ^1 0.1 0.1 0.1 0.1 10 force @a 
execute if entity @s[scores={attack_timer=1..30}] run tp @s ~ ~ ~ ~25 ~-1
execute if entity @s[scores={attack_timer=30}] run playsound item.firecharge.use hostile @a ~ ~ ~ 2 1
execute if entity @s[scores={attack_timer=30}] run summon area_effect_cloud ~ ~ ~ {Duration:200,Tags:[fire_tornado_blaze_lord]}
execute if entity @s[scores={attack_timer=30}] run tag @s remove fire_tornado