tag @s add content_lock.progression_scaled
execute if entity @s[type=#zombies] run return run function content_lock:mobs/passives/scaling/zombie
execute if entity @s[type=skeleton] run return run function content_lock:mobs/passives/scaling/zombie
execute if entity @s[type=piglin] run return run function content_lock:mobs/passives/scaling/zombie
execute if entity @s[type=piglin_brute] run return run function content_lock:mobs/passives/scaling/zombie
execute if entity @s[type=stray] run return run function content_lock:mobs/passives/scaling/zombie
execute if entity @s[type=wither_skeleton] run return run function content_lock:mobs/passives/scaling/wither_skeleton
execute if entity @s[type=spider] run return run function content_lock:mobs/passives/scaling/spider
execute if entity @s[type=cave_spider] run return run function content_lock:mobs/passives/scaling/spider
execute if entity @s[type=phantom] run return run function content_lock:mobs/passives/scaling/phantom
execute if entity @s[type=creeper] run return run function content_lock:mobs/passives/scaling/creeper


