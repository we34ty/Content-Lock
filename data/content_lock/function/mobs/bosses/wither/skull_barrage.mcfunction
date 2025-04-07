execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run tag @s add break_ai
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=10}] as @a[distance=0..9] facing entity @s eyes positioned ^ ^ ^1 run summon area_effect_cloud ~ ~2 ~ {Tags:["wither_skull_barrage"],Duration:32}
execute if entity @s[scores={attack_timer=10}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 2 0.6

execute if entity @s[scores={attack_timer=40}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=40}] as @a[distance=0..9] facing entity @s eyes positioned ^ ^ ^1 run summon area_effect_cloud ~ ~2 ~ {Tags:["wither_skull_barrage"],Duration:32}
execute if entity @s[scores={attack_timer=40}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 2 0.6


execute if entity @s[scores={attack_timer=52}] run tag @s remove break_ai
execute if entity @s[scores={attack_timer=52}] run tag @s remove skull_barrage


