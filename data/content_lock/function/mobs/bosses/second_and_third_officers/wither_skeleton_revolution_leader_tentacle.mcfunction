execute if entity @s[scores={attack_timer=..27}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~ ~ 0.1 0.1 0.1 1 3 force
scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1..}] run summon area_effect_cloud ~ ~ ~ {Tags:[direction_to_look_for_tentacle]}
execute if entity @s[scores={attack_timer=1..}] as @e[tag=direction_to_look_for_tentacle,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p feet
execute if entity @s[scores={attack_timer=1..}] anchored eyes rotated as @e[tag=direction_to_look_for_tentacle,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^30 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=1}] run tp @s ~ ~ ~ ~ -90
execute if entity @s[scores={attack_timer=1..}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^0.5
execute if entity @s[scores={attack_timer=1..}] as @a[distance=0..1] run damage @s 15 wither
execute if entity @s[scores={attack_timer=1..}] as @a[distance=0..1] run effect give @s wither 10 1
execute if entity @s[scores={attack_timer=28..}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~ ~ 0 0 0 1 3 force