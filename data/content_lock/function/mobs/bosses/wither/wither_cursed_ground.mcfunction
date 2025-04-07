scoreboard players add @s timer1 1
particle dust{color:[0.137, 0.067, 0.4],scale: 1} ~ ~0.1 ~ 1 0.1 1 1 20 force @a
particle enchant ~ ~0.1 ~ 1 0.1 1 0.1 20 force @a
execute if score @s timer1 matches 10 as @a[distance=0..2] run damage @s 20 wither by @e[type=wither,limit=1,sort=nearest]
execute if score @s timer1 matches 10 run playsound entity.wither.hurt hostile @a ~ ~ ~ 1 1.2
