execute as @e[type=item,distance=0..20] run data merge entity @s {Invulnerable:1b}
execute as @e[type=item,distance=0..20] in minecraft:overworld run tp @s 0 300 0
execute as @a[distance=0..40] run effect give @s slow_falling 60 0
execute as @a[distance=0..40] in minecraft:overworld run tp @s 0 300 0