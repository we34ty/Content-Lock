scoreboard players add @s timer1 1
particle dust{color:[0.22, 0.22, 0.22],scale: 0.5} ~ ~ ~ 0.1 0.1 0.1 1 10 force @a
execute if entity @s[scores={timer1=..1}] positioned ~ ~-3 ~ facing entity @p eyes positioned ~ ~3 ~ run tp @s ^ ^ ^0.3 ~ ~
execute if entity @s[scores={timer1=..1}] run summon wither_skull ~ ~ ~ {Tags:[wither_skull_barrage_skull],dangerous:1b}
execute if entity @s[scores={timer1=2..30}] run tp @s ^ ^ ^0.3
execute if entity @s[scores={timer1=2..30}] as @e[tag=wither_skull_barrage_skull,limit=1,sort=nearest] rotated as @e[tag=wither_skull_barrage,limit=1,sort=nearest] run tp @s ~ ~ ~ ~180 ~

execute if entity @s[scores={timer1=31}] run function content_lock:bosses/wither/wither_skull_barrage_end

