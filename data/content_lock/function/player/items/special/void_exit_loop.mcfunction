execute as @a[tag=content_lock.yet_to_be_spread] at @s in minecraft:overworld if loaded ~ ~ ~ run spreadplayers ~ ~ 0 1 under 328 false @s
execute as @a[tag=content_lock.yet_to_be_spread] at @s in minecraft:overworld unless loaded ~ ~ ~ run schedule function content_lock:player/items/special/void_exit_loop 1t replace
execute as @a[tag=content_lock.yet_to_be_spread] at @s in minecraft:overworld if loaded ~ ~ ~ run tag @s remove content_lock.yet_to_be_spread
