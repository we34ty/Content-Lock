execute if score @s content_lock.item_use_cooldown matches 1.. run return 0
scoreboard players set @s content_lock.item_use_cooldown 20

scoreboard players set @s content_lock.temp1 0
scoreboard players set @s content_lock.temp3 0
data merge storage content_lock:saved_stats {value:0}
function content_lock:player/items/silver_tape_loop with storage content_lock:saved_stats