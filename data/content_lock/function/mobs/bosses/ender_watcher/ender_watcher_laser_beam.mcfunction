scoreboard players add @s progression 1
execute if entity @s[scores={progression=80..}] run return 0
particle minecraft:electric_spark ~ ~ ~ 0 0 0 0.5 10 force @a
tp @s ^ ^ ^1
execute as @a[distance=0..1] run damage @s 40 mob_attack by @s
playsound block.fire.extinguish hostile @a ~ ~ ~ 0.1 1.7
execute as @s at @s run function content_lock:bosses/ender_watcher/ender_watcher_laser_beam