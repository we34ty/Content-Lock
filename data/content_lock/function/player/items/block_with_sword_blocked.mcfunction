function content_lock:player/items/reduce_weapon_durability {damage:2}

execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats attack_speed 1
scoreboard players set @s content_lock.temp2 10
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
scoreboard players operation @s content_lock.temp2 < @s lsp.stamina
execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= @s content_lock.temp2

execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0