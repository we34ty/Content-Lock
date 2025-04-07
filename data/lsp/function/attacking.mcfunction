data merge storage content_lock:saved_stats {attack_speed:0.0f}
execute store result storage content_lock:saved_stats attack_speed float 1 run attribute @s attack_speed get
execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats attack_speed 30
scoreboard players set @s[scores={content_lock.temp1=61..}] content_lock.temp1 60
scoreboard players set @s content_lock.temp2 70
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1
execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= @s content_lock.temp2
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0