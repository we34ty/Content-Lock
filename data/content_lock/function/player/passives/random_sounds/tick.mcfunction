execute at @s unless predicate content_lock:under_roof run return 0
execute at @s if predicate content_lock:is_dim_light run return 0
execute at @s if entity @r[distance=0.1..25] run return 0
tag @e remove content_lock.attacker
execute on attacker run tag @s add content_lock.attacker
execute if entity @e[tag=content_lock.attacker,distance=..20] run return 0

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:1000}

execute if score @s content_lock.temp1 matches 1..100 at @s if entity @e[type=area_effect_cloud,tag=content_lock.sound4_generator,distance=..40] as @e[tag=content_lock.sound4_generator,limit=1,sort=nearest] at @s run return run function content_lock:player/passives/random_sounds/sound4_1
execute if score @s content_lock.temp1 matches 101..200 at @s if entity @e[type=area_effect_cloud,tag=content_lock.sound4_generator,distance=..40] as @e[tag=content_lock.sound4_generator,limit=1,sort=nearest] at @s run return run function content_lock:player/passives/random_sounds/sound4_2
execute if score @s content_lock.temp1 matches 201..300 at @s if entity @e[type=area_effect_cloud,tag=content_lock.sound4_generator,distance=..40] as @e[tag=content_lock.sound4_generator,limit=1,sort=nearest] at @s run return run function content_lock:player/passives/random_sounds/sound4_3

execute unless score @s content_lock.temp1 matches 1..4 run return 0

execute if score @s content_lock.temp1 matches 1 at @s run function content_lock:player/passives/random_sounds/sound1
execute if score @s content_lock.temp1 matches 2 at @s run function content_lock:player/passives/random_sounds/sound2
execute if score @s content_lock.temp1 matches 3 at @s run function content_lock:player/passives/random_sounds/sound3
execute if score @s content_lock.temp1 matches 3 at @s run function content_lock:player/passives/random_sounds/sound4