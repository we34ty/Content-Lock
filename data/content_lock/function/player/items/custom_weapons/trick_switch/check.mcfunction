execute if score @s content_lock.item_use_cooldown matches 1.. run return 0
scoreboard players set @s content_lock.item_use_cooldown 5

function content_lock:player/items/custom_weapons/trick_switch/turn_back
