execute if score @s content_lock.item_use_cooldown matches 1.. run return 0
scoreboard players set @s content_lock.item_use_cooldown 10

tag @s remove content_lock.silver_tape_used
tag @s remove content_lock.silver_tape_used_up
scoreboard players set @s content_lock.temp1 0
scoreboard players set @s content_lock.temp3 0
data merge storage content_lock:saved_stats {value:0}
function content_lock:player/items/silver_tape_loop with storage content_lock:saved_stats

execute if entity @s[tag=content_lock.silver_tape_used_up] run return run playsound minecraft:item.content_lock.silver_tape.end player @a ~ ~ ~ 1 1
execute if entity @s[tag=content_lock.silver_tape_used] run return run playsound minecraft:item.content_lock.silver_tape player @a ~ ~ ~ 1 1
playsound minecraft:item.content_lock.silver_tape.fail player @a ~ ~ ~ 1 1
scoreboard players set @s content_lock.temp1 -5
item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add