function content_lock:player_passives/parry/projectile_parry_rotate
execute rotated as @e[tag=zombified_piglin_princess,limit=1,sort=nearest] run tp @s ^ ^ ^1 ~ ~
particle flame ~ ~ ~ 0 0 0 0.03 10 force @a
execute if score @s timer1 matches 3.. as @e[distance=0..2,type=!#entities] run damage @s 10 magic by @e[tag=zombified_piglin_princess,limit=1,sort=nearest]
scoreboard players add @s timer1 1
kill @s[scores={timer1=10..}]
execute if entity @s[scores={timer1=10..}] run return 0
execute as @s at @s run function content_lock:bosses/zombified_piglin_princess/zombified_piglin_princess_laser