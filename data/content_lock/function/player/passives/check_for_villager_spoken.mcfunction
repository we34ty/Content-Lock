execute at @s if entity @e[type=minecraft:wandering_trader,limit=1,sort=nearest,distance=0..6] run function content_lock:player/modify_wandering_trader/main

scoreboard players set @s content_lock.spoken_with_villager 0