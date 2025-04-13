execute at @s unless predicate content_lock:under_roof run return 0
execute at @s if predicate content_lock:is_dim_light run return 0

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:1000}
execute unless score @s content_lock.temp1 matches 1..3 run return 0

execute if score @s content_lock.temp1 matches 1 at @s run function content_lock:player/passives/random_sounds/sound1
execute if score @s content_lock.temp1 matches 2 at @s run function content_lock:player/passives/random_sounds/sound2
execute if score @s content_lock.temp1 matches 3 at @s run function content_lock:player/passives/random_sounds/sound3