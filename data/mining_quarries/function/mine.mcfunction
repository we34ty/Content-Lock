execute if entity @s[tag=content_lock.quarry.miner.tagged] run scoreboard players add @s content_lock.attack_timer 1
execute unless score @s content_lock.timer1 matches 1.. run scoreboard players set @s content_lock.timer1 16
execute at @s as @e[type=minecraft:marker,tag=content_lock.quarry,distance=..100] if score @s content_lock.quarry_id = @e[type=minecraft:marker,tag=content_lock.quarry.miner,limit=1,sort=nearest,distance=..0.01] content_lock.quarry_id run tag @s add content_lock.quarry.current
execute if entity @s[tag=content_lock.quarry.miner.tagged] run function mining_quarries:mine_look_deep
tag @e remove content_lock.quarry.current
particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.4 0.4 0.4 1 30 force @a
execute unless entity @s[tag=content_lock.quarry.miner.tagged] facing entity @e[tag=content_lock.quarry,limit=1,sort=nearest] feet rotated as @e[tag=content_lock.quarry,limit=1,sort=nearest] run rotate @s ~90 0


scoreboard players operation @s content_lock.temp1 = @s content_lock.attack_timer
scoreboard players operation @s content_lock.temp1 %= @s content_lock.timer1


execute if entity @s[tag=content_lock.quarry.miner.tagged] unless score @s content_lock.temp1 matches 7..8 unless score @s content_lock.temp1 matches 0 unless score @s content_lock.temp1 matches 15 run tp @s ^ ^ ^1
execute if entity @s[tag=content_lock.quarry.miner.tagged] if score @s content_lock.temp1 matches 0 run tp @s ^ ^ ^1 ~-90 0
execute if entity @s[tag=content_lock.quarry.miner.tagged] if score @s content_lock.temp1 matches 15 run tp @s ^ ^ ^1 ~-90 0
execute if entity @s[tag=content_lock.quarry.miner.tagged] if score @s content_lock.temp1 matches 7..8 run tp @s ^ ^ ^1 ~90 0

scoreboard players operation @s content_lock.temp1 = @s content_lock.attack_timer
scoreboard players set @s content_lock.temp2 4
scoreboard players operation @s content_lock.timer1 *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 %= @s content_lock.timer1
scoreboard players operation @s content_lock.timer1 /= @s content_lock.temp2

execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^1 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^2 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^3 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^4 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^5 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^6 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 positioned ^7 ^ ^ run particle dust{color:14671631,scale:1} ~ ~0.2 ~ 0.15 0.15 0.15 1 15 normal @a
execute if score @s[tag=content_lock.quarry.miner.tagged] content_lock.temp1 matches 0 run tp @s ^7 ^ ^ ~90 ~

tag @s add content_lock.quarry.miner.tagged