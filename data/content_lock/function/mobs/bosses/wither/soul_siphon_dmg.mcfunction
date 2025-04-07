
playsound entity.wither.shoot hostile @a ~ ~ ~ 1 0.4
particle soul ~ ~ ~ 4.5 4.5 4.5 0.4 400 force @a
particle portal ~ ~1 ~ 1 1 1 1 400 force @a
execute as @a[distance=0..9] run damage @s 10 wither by @e[type=wither,limit=1,sort=nearest]
execute as @a[distance=0..9] as @e[tag=soul_siphon,distance=0..9] store result entity @s Health float 1 run data get entity @s Health 1.05
data merge entity @s {NoAI:1b}


