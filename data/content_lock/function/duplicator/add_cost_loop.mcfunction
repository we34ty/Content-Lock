scoreboard players set @s content_lock.temp3 2
execute if score @s content_lock.temp1 matches 2.. run scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp3

scoreboard players remove @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 2.. run return run function content_lock:duplicator/add_cost_loop

scoreboard players operation @s content_lock.duplication_cost += @s content_lock.temp2
scoreboard players set @s content_lock.temp2 1

