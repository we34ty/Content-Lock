execute unless items block ~ ~ ~ container.4 #minecraft:pickaxes run return fail
scoreboard players remove @s quarry_cooldown 10
execute if score @s quarry_cooldown matches ..0 run function mining_quarries:quarry