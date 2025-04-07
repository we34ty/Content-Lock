function content_lock:player_passives/parry/projectile_parry_rotate
scoreboard players add @s timer1 1
execute if entity @s[scores={timer1=80}] run tp @s ~ ~ ~ facing entity @p feet
execute if entity @s[scores={timer1=1..10}] run particle soul_fire_flame ~ ~ ~ 0.2 0.2 0.2 0 10 force
execute if entity @s[scores={timer1=11..30}] run particle soul_fire_flame ~ ~ ~ 0.6 0.6 0.6 0 30 force
execute if entity @s[scores={timer1=31..}] run particle soul_fire_flame ~ ~ ~ 1 1 1 0 60 force
execute if entity @s[scores={timer1=80..},tag=!projectile_boosted] if block ~ ~ ~ #walkable run tp @s ^ ^ ^0.2
execute if entity @s[scores={timer1=80..},tag=projectile_boosted] if block ~ ~ ~ #walkable run tp @s ^ ^ ^0.6
execute if entity @s[scores={timer1=80..}] unless block ~ ~ ~ #walkable run playsound entity.generic.explode hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={timer1=80..}] unless block ~ ~ ~ #walkable run particle soul_fire_flame ~ ~ ~ 1 1 1 1 500 force
execute if entity @s[scores={timer1=80..}] unless block ~ ~ ~ #walkable as @e[distance=0..6,type=!#entities] run damage @s 80 explosion
execute if entity @s[scores={timer1=80..}] unless block ~ ~ ~ #walkable run kill @s