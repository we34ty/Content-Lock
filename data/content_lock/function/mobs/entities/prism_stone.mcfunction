scoreboard players add @s content_lock.timer1 1

execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] if block ^ ^ ^0.5 #walkable run tp @s ^ ^ ^0.5 ~ ~3
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ^ ^ ^0.5 #walkable run function content_lock:mobs/entities/prism_stone_hit

execute at @s if entity @s[tag=content_lock.prism_stone.fallen] if block ~ ~ ~ #air run setblock ~ ~ ~ light[level=9]

execute if score @s content_lock.timer1 matches 400.. if block ~ ~ ~ light run setblock ~ ~ ~ air replace
execute if score @s content_lock.timer1 matches 400.. run kill @s
