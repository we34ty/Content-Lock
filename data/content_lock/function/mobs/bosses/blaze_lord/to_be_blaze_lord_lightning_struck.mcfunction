scoreboard players add @s timer1 1
execute if entity @s[scores={timer1=1}] run spreadplayers ~ ~ 3 20 false @s
execute if entity @s[scores={timer1=1..}] run particle electric_spark ~ ~ ~ 0.2 0.1 0.2 0 5 force
execute if entity @s[scores={timer1=40..}] run summon lightning_bolt ~ ~ ~