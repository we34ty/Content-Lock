execute at @s if entity @p[distance=2..8] facing entity @p eyes run tp @s ^ ^ ^0.2 ~ ~
execute at @s if entity @p[distance=..1.9] at @p positioned ~ ~1.1 ~ rotated as @p positioned ^ ^ ^0.2 run tp @s ~ ~ ~ ~180 ~
execute at @s if entity @p[distance=..1.9] run effect give @p blindness 2 0 false
execute at @s[tag=!content_lock.latched_onto_player] if entity @p[distance=..1.9] run playsound entity.bat.death hostile @a ~ ~ ~ 1 1.4
execute at @s[tag=!content_lock.latched_onto_player] if entity @p[distance=..1.9] at @p positioned ~ ~1.1 ~ rotated as @p positioned ^ ^ ^0.2 run particle dust{color:0,scale:2} ~ ~ ~ 0.3 0.3 0.3 1 20 normal @a
execute at @s[tag=!content_lock.latched_onto_player] if entity @p[distance=..1.9] run tag @s add content_lock.latched_onto_player