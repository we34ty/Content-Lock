scoreboard players set @s content_lock.temp1 128
scoreboard players operation @s content_lock.temp3 = @s content_lock.duplication_storage
scoreboard players operation @s content_lock.temp3 /= @s content_lock.temp1
execute if score @s content_lock.temp3 matches 100.. run scoreboard players set @s content_lock.temp3 99

data merge storage content_lock:saved_stats {item:"minecraft:nether_star",slot:19b,amount:1}
execute store result storage content_lock:saved_stats amount int 1 run scoreboard players get @s content_lock.temp3
execute if score @s content_lock.temp3 matches 1.. run function content_lock:duplicator/replace_macro with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp3 *= @s content_lock.temp1
scoreboard players operation @s content_lock.temp2 = @s content_lock.duplication_storage
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp3
scoreboard players set @s content_lock.temp1 9
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
execute if score @s content_lock.temp2 matches 100.. run scoreboard players set @s content_lock.temp2 99

data merge storage content_lock:saved_stats {item:"minecraft:lapis_block",slot:20b,amount:1}
execute store result storage content_lock:saved_stats amount int 1 run scoreboard players get @s content_lock.temp2
execute if score @s content_lock.temp2 matches 1.. run function content_lock:duplicator/replace_macro with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1
scoreboard players operation @s content_lock.temp1 = @s content_lock.duplication_storage
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute if score @s content_lock.temp1 matches 100.. run scoreboard players set @s content_lock.temp1 99

data merge storage content_lock:saved_stats {item:"minecraft:lapis_lazuli",slot:21b,amount:1}
execute store result storage content_lock:saved_stats amount int 1 run scoreboard players get @s content_lock.temp1
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/replace_macro with storage content_lock:saved_stats