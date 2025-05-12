

scoreboard players remove @s quarry_temp_var 1
function mining_quarries:spawn_loot
execute if score @s quarry_temp_var matches 1.. run function mining_quarries:spawn_loot_loop