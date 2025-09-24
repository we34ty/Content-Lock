
execute if block ~ ~ ~ bedrock run return fail
execute if block ~ ~ ~ obsidian run return fail
execute if block ~ ~ ~ barrier run return fail
execute if block ~ ~ ~ light run return fail
execute if block ~ ~ ~ end_portal run return fail
execute if block ~ ~ ~ end_portal_frame run return fail
execute if block ~ ~ ~ reinforced_deepslate run return fail

particle dust{color:14643215,scale:1} ~ ~0.1 ~ 0.1 0.1 0.1 1 3 normal @a

execute if block ~ ~ ~ #airs_and_liquids positioned ~ ~-1 ~ run function mining_quarries:mine_look_deep

scoreboard players set @s content_lock.temp1 0
execute unless block ~ ~ ~ #airs_and_liquids if items block ~ ~ ~ container.* * run scoreboard players set @s content_lock.temp1 1

execute unless block ~ ~ ~ #airs_and_liquids if score @s content_lock.temp1 matches 0 run function mining_quarries:mine_generate_loot
execute unless block ~ ~ ~ #airs_and_liquids if score @s content_lock.temp1 matches 1 run setblock ~ ~ ~ air destroy
tp @e[type=item,distance=..1] @e[tag=content_lock.quarry.current,limit=1,sort=nearest]

execute unless block ~ ~ ~ #airs_and_liquids run setblock ~ ~ ~ air
#kill @e[type=item,distance=..1] 
