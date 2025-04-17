execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= blocking.stamina.consumption lsp.Values
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
#execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0
scoreboard players set @s content_lock.shield_damage_blocked 0