execute if entity @s[tag=content_lock.enchanted_witch] run function content_lock:mobs/bosses/enchanted_witch/enchanted_witch
execute if entity @s[tag=content_lock.iron_guardian] run function content_lock:mobs/bosses/iron_guardian/iron_guardian
execute if entity @s[tag=content_lock.death_rider] run function content_lock:mobs/bosses/death_rider/death_rider
execute if entity @s[tag=content_lock.death_rider_horse] unless entity @e[tag=content_lock.death_rider] run function content_lock:mobs/bosses/boss_despawn


