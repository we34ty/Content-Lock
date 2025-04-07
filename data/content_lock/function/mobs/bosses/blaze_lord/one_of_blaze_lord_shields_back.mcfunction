function content_lock:player_passives/parry/projectile_parry_rotate
scoreboard players add @s timer1 1
execute as @e[distance=0..1,type=!#entities] run damage @s 30 fly_into_wall
execute if entity @s[scores={timer1=10..},tag=!projectile_boosted] run tp @s ^0.7 ^ ^
execute if entity @s[scores={timer1=10..},tag=projectile_boosted] run tp @s ^ ^ ^1
execute if entity @s[scores={timer1=10..}] run particle soul_fire_flame ~ ~ ~ 0.2 1.2 0.2 0.02 10 force
execute if entity @s[scores={timer1=10}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={timer1=20..}] run kill @s