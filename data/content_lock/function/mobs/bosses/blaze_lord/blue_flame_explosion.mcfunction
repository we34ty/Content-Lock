execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={attack_timer=1}] run particle minecraft:portal ~ ~1 ~ 0 0 0 1 200 force
execute if entity @s[scores={attack_timer=60}] run particle soul_fire_flame ~ ~1 ~ 1 1 1 1 300 force
execute if entity @s[scores={attack_timer=60}] run playsound entity.generic.explode hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={attack_timer=60}] as @a[distance=0..4] run damage @s 40 freeze
execute if entity @s[scores={attack_timer=60}] run tag @s remove blue_flame_explosion