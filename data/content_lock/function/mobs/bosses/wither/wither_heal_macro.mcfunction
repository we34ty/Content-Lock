execute if score @s content_lock.wither_regen matches 11.. run scoreboard players set @s content_lock.wither_regen 10
data merge storage content_lock:saved_stats {heal_amount:0.0f}
execute store result storage content_lock:saved_stats heal_amount float 0.1 run scoreboard players get @s content_lock.wither_regen
