
scoreboard players add @s timer1 1
execute if entity @s[scores={timer1=30..}] run tp @s ^ ^ ^ ~60 ~
execute if entity @s[scores={timer1=30..}] run particle flame ~ ~ ~ 0.2 1.2 0.2 0.02 10 force
execute if entity @s[scores={timer1=30..}] run particle flame ~ ~ ~ 2.5 1.2 2.5 0.02 40 force
execute if entity @s[scores={timer1=30..}] as @a[distance=0..3.5] run damage @s 30 in_fire
execute if entity @s[scores={timer1=30}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={timer1=70..}] run kill @s