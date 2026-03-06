execute if entity @s[type=experience_orb] run return run kill @s
execute if entity @s[type=block_display,tag=content_lock.venom_billiard_ball] at @s run function content_lock:mobs/entities/venom_billiard/tick
execute if entity @s[type=block_display,tag=content_lock.prism_stone] at @s run function content_lock:mobs/entities/prism_stone
execute if entity @s[type=#arrows,tag=!content_lock.arrow.changed_damage] at @s run function content_lock:mobs/entities/projectiles/arrows
execute if entity @s[type=marker,tag=content_lock.enchantment.lightstruck.lightning] at @s run function content_lock:player/enchantments/lightstruck/lightning
execute if entity @s[type=fishing_bobber] at @s if block ~ ~ ~ #water_filled run tp @s ~ ~0.1 ~

execute if entity @s[type=minecraft:block_display,tag=content_lock.death_rider.throw_zombie_head.display] at @s run function content_lock:mobs/customization/active/zombie_head
execute if entity @s[type=area_effect_cloud,tag=content_lock.enemy_fireball] run function content_lock:mobs/customization/active/flying_fireball

execute if entity @s[tag=content_lock.third_officer.fireball.projectile] at @s run function content_lock:mobs/bosses/second_and_third_officers/ghast/fireball_projectile

execute if entity @s[tag=content_lock.duplicator] at @s run function content_lock:duplicator/check

execute if entity @s[type=item,nbt={Item:{components:{"minecraft:custom_data":{"content_lock:clear_in_inventory":true}}}}] run kill @s
execute if entity @s[type=item,nbt={Item:{components:{"minecraft:custom_data":{"content_lock:duplication_result":true}}}}] run kill @s

execute if entity @s[type=minecraft:item_display,tag=aj.weapons.root] at @s run function content_lock:player/weapons/entity/check_type
execute if entity @s[type=minecraft:block_display,tag=content_lock.weapons.hitbox.display] if score @s content_lock.weapons.cooldown matches 1.. run kill @s
execute if entity @s[type=minecraft:block_display,tag=content_lock.weapons.hitbox.display] run scoreboard players add @s content_lock.weapons.cooldown 1

execute if entity @s[tag=!content_lock.carapacer.taken_shape,tag=aj.carapacer.root] run function animated_java:carapacer/remove/this
execute if entity @s[tag=content_lock.carapacer.taken_shape] run tag @s remove content_lock.carapacer.taken_shape

#removal of wormholes based on entity near their position (if they weren't loaded before)
execute if entity @s[tag=content_lock.wormhole.remover] at @s as @e[type=minecraft:item_display,tag=aj.wormhole.root,distance=..1] run function animated_java:wormhole/remove/this
execute if entity @s[tag=content_lock.wormhole.remover] run kill @s
#functions for wormholes
execute if entity @s[type=minecraft:item_display,tag=aj.wormhole.root,tag=content_lock.wormhole.open] run function content_lock:mobs/entities/wormhole/tick

#execute if entity @e[type=trident,tag=!content_lock.arrow.changed_damage] as @e[type=trident,tag=!content_lock.arrow.changed_damage] at @s run function content_lock:mobs/entities/projectiles/arrows
#execute if entity @e[type=area_effect_cloud,tag=content_lock.prism_stone.light_source] as @e[type=area_effect_cloud,tag=content_lock.prism_stone.light_source] at @s run function content_lock:mobs/entities/prism_stone_light
