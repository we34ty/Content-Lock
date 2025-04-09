execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:2}

execute if score @s content_lock.temp1 matches 1 run function content_lock:player/modify_wandering_trader/random_trade5/1
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/modify_wandering_trader/random_trade5/2