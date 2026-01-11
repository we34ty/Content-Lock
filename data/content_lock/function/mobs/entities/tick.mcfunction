execute if entity @s[type=experience_orb] run return run kill @s
execute if entity @s[type=block_display,tag=content_lock.venom_billiard_ball] at @s run function content_lock:mobs/entities/venom_billiard/tick
execute if entity @s[type=block_display,tag=content_lock.prism_stone] at @s run function content_lock:mobs/entities/prism_stone
execute if entity @s[type=#arrows,tag=!content_lock.arrow.changed_damage] at @s run function content_lock:mobs/entities/projectiles/arrows
execute if entity @s[type=marker,tag=content_lock.enchantment.lightstruck.lightning] at @s run function content_lock:player/enchantments/lightstruck/lightning
execute if entity @s[type=fishing_bobber] at @s if block ~ ~ ~ #water_filled run tp @s ~ ~0.1 ~

execute if entity @s[type=minecraft:block_display,tag=content_lock.death_rider.throw_zombie_head.display] at @s run function content_lock:mobs/customization/active/zombie_head
execute if entity @s[type=area_effect_cloud,tag=content_lock.enemy_fireball] run function content_lock:mobs/customization/active/flying_fireball
#execute if entity @e[type=trident,tag=!content_lock.arrow.changed_damage] as @e[type=trident,tag=!content_lock.arrow.changed_damage] at @s run function content_lock:mobs/entities/projectiles/arrows
#execute if entity @e[type=area_effect_cloud,tag=content_lock.prism_stone.light_source] as @e[type=area_effect_cloud,tag=content_lock.prism_stone.light_source] at @s run function content_lock:mobs/entities/prism_stone_light
