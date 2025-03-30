execute if entity @r[tag=content_lock.remove_health_deprived] as @a[tag=content_lock.remove_health_deprived] run attribute @s max_health modifier remove content_lock.heal_macro
execute if entity @r[tag=content_lock.remove_health_deprived] as @a[tag=content_lock.remove_health_deprived] run tag @s remove content_lock.remove_health_deprived
execute if score @r content_lock.healing_from_food matches 1.. as @a[scores={content_lock.healing_from_food=1..}] run function content_lock:player/passives/healing_from_food_start
