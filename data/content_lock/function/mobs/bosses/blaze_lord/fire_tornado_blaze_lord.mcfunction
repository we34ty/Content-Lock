scoreboard players add @s timer1 1
particle flame ~ ~ ~ 0.3 2 0.3 0.01 10 force
particle flame ~ ~3 ~ 0.6 2 0.6 0.01 30 force
particle flame ~ ~6 ~ 0.9 2 0.9 0.01 90 force
execute as @a[distance=0..1.5] run damage @s 30 in_fire
tp @s ^ ^ ^0.5 ~35 ~
#setblock ~ ~ ~ fire
