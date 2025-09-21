execute as @e[type=minecraft:marker,tag=content_lock.quarry] at @s run execute unless block ~ ~ ~ minecraft:dropper run function mining_quarries:destroyed
execute as @e[type=minecraft:marker,tag=content_lock.quarry] at @s run function mining_quarries:check_cooldown
schedule function mining_quarries:quarry_tick 10t replace