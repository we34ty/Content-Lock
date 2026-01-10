execute if entity @s[tag=content_lock.remove_health_deprived_2_ticks] run return run tag @s remove content_lock.remove_health_deprived_2_ticks
execute if entity @s[tag=content_lock.remove_health_deprived] run attribute @s max_health modifier remove content_lock.heal_macro
execute if entity @s[tag=content_lock.remove_health_deprived] run advancement grant @s only content_lock:checks/entity_hurt_player
execute if entity @s[tag=content_lock.remove_health_deprived] run tag @s remove content_lock.remove_health_deprived
execute if score @s content_lock.healing_from_food matches 1.. run function content_lock:player/passives/healing_from_food_start