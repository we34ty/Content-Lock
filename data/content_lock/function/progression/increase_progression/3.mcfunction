##makes sure the game goes through all of the progression stages
execute unless score L content_lock.progression matches 2.. run function content_lock:progression/increase_progression/2
##doesn't change the progression if it's already at this stage
execute if score L content_lock.progression matches 3.. run return 0

scoreboard players set L content_lock.progression 3
playsound minecraft:block.beacon.power_select neutral @a ~ ~ ~ 1000000 0.6
tellraw @a [{"translate": "content_lock:notifications.progression.3","color": "light_purple"}]