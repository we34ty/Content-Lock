scoreboard players add @s content_lock.timer1 1
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] if block ~ ~-0.5 ~ #walkable run tp @s ~ ~-0.5 ~
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ~ ~-0.5 ~ #walkable if score @s content_lock.timer1 matches ..9 run playsound block.glass.place voice @a ~ ~ ~ 10 0.5
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ~ ~-0.5 ~ #walkable if score @s content_lock.timer1 matches 10..23 run playsound block.glass.place voice @a ~ ~ ~ 10 2
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ~ ~-0.5 ~ #walkable if score @s content_lock.timer1 matches 24..47 run playsound block.glass.break voice @a ~ ~ ~ 10 1
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ~ ~-0.5 ~ #walkable if score @s content_lock.timer1 matches 48.. run playsound entity.ghast.hurt voice @a ~ ~ ~ 10 2
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ~ ~-0.5 ~ #walkable if score @s content_lock.timer1 matches 48.. run kill @s
execute at @s unless entity @s[tag=content_lock.prism_stone.fallen] unless block ~ ~-0.5 ~ #walkable run tag @s add content_lock.prism_stone.fallen

execute if score L content_lock.timer1 matches 8 at @s if entity @s[tag=content_lock.prism_stone.fallen] if block ~ ~ ~ #air run summon area_effect_cloud ~ ~ ~ {Duration:22,Tags:["content_lock.prism_stone.light_source"]}

execute if score @s content_lock.timer1 matches 400 run kill @s
