execute unless score L content_lock.progression matches 1.. run function content_lock:progression/increase_progression/1
execute if score L content_lock.progression matches 2.. run return 0

scoreboard players set L content_lock.progression 2
playsound minecraft:block.beacon.power_select neutral @a ~ ~ ~ 1000000 0.6
tellraw @a [{"translate": "content_lock:notifications.progression.2","color": "light_purple"}]