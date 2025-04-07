execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] run playsound minecraft:entity.piglin.jealous hostile @a ~ ~ ~ 1 0.7
execute if entity @s[scores={attack_timer=1}] run tp @s ~ ~ ~ ~ 90
execute if entity @s[scores={attack_timer=1}] run particle flame ~ ~1 ~ 0 0 0 1 100 force @a
execute if entity @s[scores={attack_timer=15}] run playsound minecraft:entity.piglin.jealous hostile @a ~ ~ ~ 1 0.7
execute if entity @s[scores={attack_timer=15}] run particle flame ~ ~1 ~ 0 0 0 1 100 force @a
execute if entity @s[scores={attack_timer=15}] as @a[distance=0..2] run damage @s 30 bad_respawn_point
execute if entity @s[scores={attack_timer=25}] run particle block{block_state:{Name:netherrack}} ~ ~0.2 ~ 2 0 2 1 700 force
execute if entity @s[scores={attack_timer=25}] run playsound minecraft:block.netherrack.place hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=29}] run particle block{block_state:{Name:netherrack}} ~ ~0.6 ~ 2 0 2 1 700 force
execute if entity @s[scores={attack_timer=29}] run playsound minecraft:block.netherrack.place hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=33}] run particle block{block_state:{Name:netherrack}} ~ ~1 ~ 2 0 2 1 700 force
execute if entity @s[scores={attack_timer=33}] run playsound minecraft:block.netherrack.place hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=37}] run particle block{block_state:{Name:netherrack}} ~ ~1.4 ~ 2 0 2 1 700 force
execute if entity @s[scores={attack_timer=37}] run playsound minecraft:block.netherrack.place hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=41}] run particle block{block_state:{Name:netherrack}} ~ ~0.8 ~ 2 0 2 1 700 force
execute if entity @s[scores={attack_timer=41}] run playsound minecraft:block.netherrack.place hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=45}] run particle block{block_state:{Name:netherrack}} ~ ~0.2 ~ 2 0 2 1 700 force
execute if entity @s[scores={attack_timer=45}] run playsound minecraft:block.netherrack.place hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=25..45}] as @a[distance=0..4] run damage @s 15 falling_block
execute if entity @s[scores={attack_timer=50}] facing entity @p feet run tp @s ~ ~ ~ ~ -50
execute if entity @s[scores={attack_timer=60..80}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^0.3 ~ ~5
execute if entity @s[scores={attack_timer=60..80}] unless block ~ ~ ~ #walkable run particle flame ~ ~ ~ 3 3 3 0.1 300 force @a
execute if entity @s[scores={attack_timer=60..80}] unless block ~ ~ ~ #walkable run playsound minecraft:entity.dragon_fireball.explode hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={attack_timer=60..80}] unless block ~ ~ ~ #walkable as @a[distance=0..3] run damage @s 30 mob_attack by @e[tag=zombified_piglin_princess,limit=1]
execute if entity @s[scores={attack_timer=60..80}] unless block ~ ~ ~ #walkable run scoreboard players set @s attack_timer 82
execute if entity @s[scores={attack_timer=81}] run particle flame ~ ~ ~ 3 3 3 0.1 300 force @a
execute if entity @s[scores={attack_timer=81}] run playsound minecraft:entity.dragon_fireball.explode hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={attack_timer=81}] as @a[distance=0..3] run damage @s 20 mob_attack by @e[tag=zombified_piglin_princess,limit=1]
execute if entity @s[scores={attack_timer=82}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=82}] run tag @s remove leap_at_player