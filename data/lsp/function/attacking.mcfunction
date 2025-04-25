data merge storage content_lock:saved_stats {attack_speed:0.0f}
execute store result storage content_lock:saved_stats attack_speed float 0.01 run attribute @s attack_speed get 10000
execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats attack_speed 1
execute if score @s content_lock.temp1 matches 400.. run scoreboard players set @s content_lock.temp1 400
scoreboard players set @s content_lock.temp2 15000
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
scoreboard players add @s content_lock.temp2 40
scoreboard players operation @s content_lock.temp2 < @s lsp.stamina
execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= @s content_lock.temp2
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
#execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0