function content_lock:player_passives/parry/projectile_parry_rotate
scoreboard players add @s timer1 1
execute if entity @s[scores={timer1=..52}] as @a[distance=0..1] run damage @s 40 fly_into_wall
execute if entity @s[scores={timer1=53..}] as @e[distance=0..1,type=!#entities] run damage @s 40 fly_into_wall
execute if entity @s[scores={timer1=50..},tag=!projectile_boosted] run tp @s ^0.5 ^ ^
execute if entity @s[scores={timer1=50..},tag=projectile_boosted] rotated ~ 0 run tp @s ^ ^ ^1
execute if entity @s[scores={timer1=50..}] run particle flame ~ ~ ~ 0.2 1.2 0.2 0.02 10 force
execute if entity @s[scores={timer1=50}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={timer1=60..}] run kill @s