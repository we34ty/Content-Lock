execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run tag @s add break_ai

execute if entity @s[scores={attack_timer=48}] run playsound entity.wither.spawn hostile @a ~ ~ ~ 1 1.4

execute if entity @s[scores={attack_timer=10}] run playsound entity.shulker.shoot hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=10}] run data merge entity @s {Glowing:1b}
execute if entity @s[scores={attack_timer=15}] run data merge entity @s {Glowing:0b}

execute if entity @s[scores={attack_timer=20}] run playsound entity.shulker.shoot hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=20}] run data merge entity @s {Glowing:1b}
execute if entity @s[scores={attack_timer=24}] run data merge entity @s {Glowing:0b}

execute if entity @s[scores={attack_timer=30}] run playsound entity.shulker.shoot hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=30}] run data merge entity @s {Glowing:1b}
execute if entity @s[scores={attack_timer=33}] run data merge entity @s {Glowing:0b}

execute if entity @s[scores={attack_timer=38}] run playsound entity.shulker.shoot hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=38}] run data merge entity @s {Glowing:1b}
execute if entity @s[scores={attack_timer=40}] run data merge entity @s {Glowing:0b}

execute if entity @s[scores={attack_timer=46}] run playsound entity.shulker.shoot hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=46}] run data merge entity @s {Glowing:1b}
execute if entity @s[scores={attack_timer=48}] run data merge entity @s {Glowing:0b}

execute if entity @s[scores={attack_timer=50}] run particle dust{color:[0.22, 0.071, 0.071],scale: 2} ~ ~ ~ 2 2 2 1 400 force @a
execute if entity @s[scores={attack_timer=60}] run particle dust{color:[0.22, 0.071, 0.071],scale: 2} ~ ~ ~ 3 3 3 1 800 force @a
execute if entity @s[scores={attack_timer=70}] run particle dust{color:[0.22, 0.071, 0.071],scale: 2} ~ ~ ~ 4.5 4.5 4.5 1 1600 force @a

execute if entity @s[scores={attack_timer=50}] run playsound entity.shulker.teleport hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=60}] run playsound entity.shulker.teleport hostile @a ~ ~ ~ 2 0.6
execute if entity @s[scores={attack_timer=70}] run playsound entity.shulker.teleport hostile @a ~ ~ ~ 2 0.6

execute if entity @s[scores={attack_timer=50}] as @a[distance=0..4] run damage @s 20 wither by @e[tag=necrotic_nova,limit=1,sort=nearest]
execute if entity @s[scores={attack_timer=60}] as @a[distance=0..6] run damage @s 15 wither by @e[tag=necrotic_nova,limit=1,sort=nearest]
execute if entity @s[scores={attack_timer=70}] as @a[distance=0..9] run damage @s 10 wither by @e[tag=necrotic_nova,limit=1,sort=nearest]

execute if entity @s[scores={attack_timer=70}] run tag @s remove break_ai
execute if entity @s[scores={attack_timer=70}] run tag @s remove necrotic_nova


