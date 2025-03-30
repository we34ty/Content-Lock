function content_lock:player/items/reduce_weapon_durability {damage:2}

execute unless score @s lsp.stamina matches ..0 run scoreboard players remove @s lsp.stamina 20
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0