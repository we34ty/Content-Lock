
execute if block ~ ~ ~ bedrock run return fail
execute if block ~ ~ ~ obsidian run return fail
execute if block ~ ~ ~ barrier run return fail
execute if block ~ ~ ~ light run return fail
execute if block ~ ~ ~ end_portal run return fail
execute if block ~ ~ ~ end_portal_frame run return fail
execute if block ~ ~ ~ reinforced_deepslate run return fail

particle dust{color:14643215,scale:1} ~ ~0.1 ~ 0.1 0.1 0.1 1 3 normal @a

execute if block ~ ~ ~ #air positioned ~ ~-1 ~ run function mining_quarries:mine_look_deep

execute unless block ~ ~ ~ #air run function mining_quarries:mine_generate_loot
tp @e[type=item,distance=..1] @e[tag=quarry,limit=1,sort=nearest]

execute unless block ~ ~ ~ #air run setblock ~ ~ ~ air
#kill @e[type=item,distance=..1] 
