scoreboard players add @s timer1 1
execute as @a[distance=0..1] run damage @s 30 fireball by @e[tag=blaze_lord,limit=1]
execute if entity @s[scores={timer1=1..40}] run tp @s ~ ~0.7 ~
execute if entity @s[scores={timer1=1..40}] run particle soul_fire_flame ~ ~ ~ 0.2 0.2 0.2 0.02 10 force
execute if entity @s[scores={timer1=1}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={timer1=41..}] run tp @s ~ ~-0.8 ~
execute if entity @s[scores={timer1=41..}] run particle soul_fire_flame ~ ~ ~ 4 4 4 0.02 400 force
execute if entity @s[scores={timer1=41..}] positioned ~ ~-1 ~ as @a[distance=0..7] run damage @s 50 fireball
execute if entity @s[scores={timer1=41..}] run playsound item.firecharge.use hostile @a ~ ~ ~ 0.5 0.7
