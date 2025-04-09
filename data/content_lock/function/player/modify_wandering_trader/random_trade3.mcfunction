execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}

execute if score @s content_lock.temp1 matches 1 run function content_lock:player/modify_wandering_trader/random_trade3/1
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/modify_wandering_trader/random_trade3/2
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/modify_wandering_trader/random_trade3/3
#execute if score @s content_lock.temp1 matches 4 run function content_lock:player/modify_wandering_trader/random_trade3/4
#execute if score @s content_lock.temp1 matches 5 run function content_lock:player/modify_wandering_trader/random_trade3/5