function content_lock:player_passives/parry/projectile_parry_rotate
execute if entity @s[scores={timer1=10..}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^1
particle dust{color:[0.914, 0.137, 0.0],scale: 1} ~ ~ ~ 0.2 0.2 0.2 0 2 force @a
particle flame ~ ~ ~ 0.2 0.2 0.2 0.01 4 force @a
scoreboard players add @s timer1 1
execute if entity @e[distance=0..1.5,limit=1,sort=random,type=!#entities] as @e[distance=0..1.5,type=!#entities] run damage @s 20 fireball by @e[tag=zombified_piglin_princess,limit=1]
execute unless block ~ ~ ~ #walkable run scoreboard players add @s timer1 5
execute if entity @s[scores={timer1=80..}] run playsound minecraft:entity.dragon_fireball.explode hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={timer1=80..}] run particle flame ~ ~ ~ 0.1 0.1 0.1 1 200 force @a
execute if entity @s[scores={timer1=80..}] as @e[distance=0..5] run damage @s 30 fireball by @e[tag=zombified_piglin_princess,limit=1]
execute if entity @s[scores={timer1=80..}] run kill @s