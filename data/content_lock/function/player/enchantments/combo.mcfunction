scoreboard players set @s content_lock.combo_timer 50
scoreboard players add @s content_lock.combo_counter 1
execute if score @s content_lock.combo_counter matches 6.. run scoreboard players set @s content_lock.combo_counter 5

execute store result score @s content_lock.temp2 run attribute @s attack_speed get 1000
scoreboard players set @s content_lock.temp1 15000
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 *= @s content_lock.combo_counter
scoreboard players operation @s content_lock.temp2 = @s content_lock.combo_counter
execute store result score @s content_lock.temp3 run data get entity @s SelectedItem.components."minecraft:enchantments".levels."content_lock:combo"
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2

data merge storage content_lock:saved_stats {value:0}
execute store result storage content_lock:saved_stats value float 0.01 run scoreboard players get @s content_lock.temp1
function content_lock:player/enchantments/combo_macro with storage content_lock:saved_stats