
execute if entity @e[type=wandering_trader] run return 0

scoreboard players set L content_lock.temp1 0
execute store result score L content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute unless score L content_lock.temp1 matches 1 run return 0

execute in overworld at @r[distance=0..] run summon wandering_trader ~ -67 ~ {Tags:["content_lock.yet_to_be_spread"],DespawnDelay:48000}
execute as @e[type=wandering_trader,tag=content_lock.yet_to_be_spread] at @s run spreadplayers ~ ~ 30 45 false @s
tag @e remove content_lock.yet_to_be_spread