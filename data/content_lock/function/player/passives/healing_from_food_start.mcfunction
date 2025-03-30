scoreboard players set @s content_lock.temp1 20
scoreboard players operation @s content_lock.healing_from_food *= @s content_lock.temp1
execute if score @s lsp.stamina < @s content_lock.max_stamina run scoreboard players operation @s lsp.stamina += @s content_lock.healing_from_food
scoreboard players operation @s content_lock.healing_from_food /= @s content_lock.temp1


scoreboard players get @s content_lock.healing_from_food
execute store result score @s content_lock.temp1 run data get entity @s Health 1000
scoreboard players set @s content_lock.temp2 1000
scoreboard players operation @s content_lock.healing_from_food *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 += @s content_lock.healing_from_food
execute store result score @s content_lock.temp2 run attribute @s max_health get 1000
scoreboard players operation @s content_lock.temp1 < @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result storage content_lock:saved_stats value float 0.001 run scoreboard players get @s content_lock.temp1
function content_lock:player/passives/heal_macro with storage content_lock:saved_stats

scoreboard players set @s content_lock.healing_from_food 0
