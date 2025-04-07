particle dust{color:[0.514, 0.0, 0.655],scale: 3} ~ ~ ~ 0.1 0.1 0.1 0 10 force
execute if entity @s[scores={attack_timer=20..}] run particle dust{color:[0.514, 0.0, 0.655],scale: 3} ~ ~ ~ 1 1 1 0 100 force
scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=20..}] run summon area_effect_cloud ~ ~ ~ {Tags:[direction_to_look_for_purple_fireball]}
execute if entity @s[scores={attack_timer=20..}] as @e[tag=direction_to_look_for_purple_fireball,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p
execute if entity @s[scores={attack_timer=20..}] anchored eyes rotated as @e[tag=direction_to_look_for_purple_fireball,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^100 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=20}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=20..}] run tp @s ^ ^ ^0.8
execute if entity @s[scores={attack_timer=20..}] run summon creeper ~ ~ ~ {ignited:1b,Silent:1b,NoAI:1b,ExplosionRadius:4,Fuse:0}
execute if entity @s[scores={attack_timer=20..}] as @a[distance=0..4] run damage @s 2048 magic by HollowPurple
execute if entity @s[scores={attack_timer=100..}] run kill @s