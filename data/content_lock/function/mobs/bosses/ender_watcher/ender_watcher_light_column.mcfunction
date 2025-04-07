scoreboard players add @s progression 1
execute if entity @s[scores={progression=1}] run playsound entity.ender_dragon.growl hostile @a ~ ~ ~ 1 1.7
particle minecraft:dust{color:[0.584, 0.0, 0.78],scale: 1} ~ ~ ~ 3 0 3 0.5 30 force @a
execute if entity @s[scores={progression=28..}] as @e[distance=0..4,type=!#entities] run damage @s 36 magic by @e[tag=ender_watcher,limit=1]
execute if entity @s[scores={progression=28..}] run particle minecraft:dust{color:[0.584, 0.0, 0.78],scale: 3} ~ ~5 ~ 2 10 2 0.5 500 force @a
execute if entity @s[scores={progression=28..}] run particle end_rod ~ ~5 ~ 2 10 2 0.1 100 force @a
execute if entity @s[scores={progression=28}] run playsound entity.ender_dragon.growl hostile @a ~ ~ ~ 1 0.7
