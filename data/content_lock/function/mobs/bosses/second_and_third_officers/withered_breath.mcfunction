execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] run tp @s ~ ~ ~ ~ -75
execute if entity @s[scores={attack_timer=1}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 1 0.7
execute if entity @s[scores={attack_timer=21}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 1 0.7
execute if entity @s[scores={attack_timer=21}] as @a[distance=0..1] run damage @s 10 wither
execute if entity @s[scores={attack_timer=21}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~ ~ 0.3 0.3 0.3 1 300 force
execute if entity @s[scores={attack_timer=23}] as @a[distance=1..2] run damage @s 10 wither
execute if entity @s[scores={attack_timer=23}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~ ~ 1 1 1 1 300 force
execute if entity @s[scores={attack_timer=25}] as @a[distance=2..3] run damage @s 10 wither
execute if entity @s[scores={attack_timer=25}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~ ~ 2 2 2 1 300 force
execute if entity @s[scores={attack_timer=27}] as @a[distance=3..4] run damage @s 10 wither
execute if entity @s[scores={attack_timer=27}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~ ~ 3 3 3 1 300 force
execute if entity @s[scores={attack_timer=28}] run tp @s ~ ~ ~ facing entity @p
execute if entity @s[scores={attack_timer=28}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={attack_timer=28..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~1.9 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=31..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~1.6 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=34..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~1.3 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=37..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~1 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=40..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~0.7 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=43..}] positioned ^ ^ ^0.4 run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~0.4 ~ 0.1 0.1 0.1 1 3 force
execute if entity @s[scores={attack_timer=46..49}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~0.1 ~ 1 0 1 1 20 force
execute if entity @s[scores={attack_timer=46..49}] as @a[distance=0..1.5] run damage @s 8 wither
execute if entity @s[scores={attack_timer=50..60}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~0.1 ~ 2 0 2 1 40 force
execute if entity @s[scores={attack_timer=50..60}] as @a[distance=0.3] run damage @s 8 wither
execute if entity @s[scores={attack_timer=61..75}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~0.1 ~ 3 0 3 1 80 force
execute if entity @s[scores={attack_timer=61..75}] as @a[distance=0..4.5] run damage @s 8 wither
execute if entity @s[scores={attack_timer=76..}] run particle dust{color:[0.173, 0.173, 0.173],scale: 1} ~ ~0.1 ~ 4 0 4 1 160 force
execute if entity @s[scores={attack_timer=76..}] as @a[distance=0..6] run damage @s 8 wither
execute if entity @s[scores={attack_timer=99}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=99}] run tag @s remove withered_breath