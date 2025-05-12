execute as @e[type=minecraft:marker,tag=quarry] at @s run execute unless block ~ ~ ~ minecraft:dropper run kill @e[tag=content_lock.quarry.miner,limit=1,sort=nearest,distance=..20]
execute as @e[type=minecraft:marker,tag=quarry] at @s run execute unless block ~ ~ ~ minecraft:dropper run kill @e[type=minecraft:marker,tag=quarry,distance=..0.01]
execute as @e[type=minecraft:marker,tag=quarry] at @s run function mining_quarries:check_cooldown
schedule function mining_quarries:quarry_tick 10t replace