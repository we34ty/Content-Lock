##doesn't change the progression if it's already at this stage
execute if score L content_lock.progression matches 1.. run return 0
scoreboard players set L content_lock.progression 1
playsound minecraft:block.beacon.power_select neutral @a ~ ~ ~ 1000000 0.6
tellraw @a [{"translate": "content_lock:notifications.progression.1","color": "light_purple"}]