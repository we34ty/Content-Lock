execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run tag @s add break_ai

execute if entity @s[scores={attack_timer=1}] run playsound entity.evoker.cast_spell hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={attack_timer=10}] at @r[distance=9.1..40] facing entity @p eyes run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=10..20}] run particle dust{color:[0.812, 0.0, 0.0],scale: 2} ~ ~1 ~ 0.3 1 0.3 1 20 force @a
execute if entity @s[scores={attack_timer=20}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={attack_timer=20..25}] run tp @s ~ ~0.6 ~
execute if entity @s[scores={attack_timer=26..30}] run tp @s ~ ~-0.6 ~
execute if entity @s[scores={attack_timer=30}] run playsound entity.generic.explode hostile @a ~ ~ ~ 2 0.8
execute if entity @s[scores={attack_timer=30}] run particle explosion_emitter ~ ~ ~ 1 0 1 1 4 force @a
execute if entity @s[scores={attack_timer=30}] as @a[distance=0..4] run damage @s 40 mob_attack by @e[type=wither,limit=1,sort=nearest]

execute if entity @s[scores={attack_timer=30}] run tag @s remove break_ai
execute if entity @s[scores={attack_timer=30}] run tag @s remove nothing_personal


