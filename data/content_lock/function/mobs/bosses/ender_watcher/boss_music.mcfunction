stopsound @a[tag=!listening_to_music,distance=0..80] music
execute as @a[distance=0..80,tag=!listening_to_music] at @s run playsound custom.ender_watcher music @s ~ ~ ~ 1 1
tag @a[distance=0..80,tag=!listening_to_music] add listening_to_music
stopsound @a[tag=listening_to_music,distance=81..120] music
tag @a[tag=listening_to_music,distance=81..120] remove listening_to_music
tag @a[scores={check_for_death=1..},tag=listening_to_music] remove listening_to_music
scoreboard players add @s timer2 1
execute if score @s timer2 matches 20 run tag @a[distance=0..80] remove listening_to_music
execute if score @s timer2 matches 15480 run scoreboard players set @s timer2 0