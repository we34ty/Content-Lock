execute if score L content_lock.options.enemy.scaling matches 1 as @e[type=#can_scale,tag=!content_lock.progression_scaled,tag=!content_lock.progression_not_scaled,distance=0..40] at @s if entity @r[distance=0..40] run function content_lock:mobs/passives/progression_scaling
execute if score L content_lock.options.enemy.customization matches 1 as @e[type=#customizable] at @s if entity @r[distance=0..40] run function content_lock:mobs/customization/tick
execute at @a if entity @e[type=experience_orb,distance=0..10,limit=1,sort=random] as @e[type=experience_orb,distance=0..10] run kill @s
execute if entity @e[type=minecraft:block_display,tag=content_lock.death_rider.throw_zombie_head.display,limit=1] as @e[type=minecraft:block_display,tag=content_lock.death_rider.throw_zombie_head.display] at @s run function content_lock:mobs/customization/active/zombie_head
execute if entity @e[type=area_effect_cloud,tag=content_lock.enemy_fireball,limit=1] as @e[type=area_effect_cloud,tag=content_lock.enemy_fireball] run function content_lock:mobs/customization/active/flying_fireball

execute if entity @e[tag=content_lock.splintered] as @e[tag=content_lock.splintered] run function content_lock:player/enchantments/splinter_countdown

#function content_lock:mobs/passives/shops/time_check_for_shop_refresh
function content_lock:mobs/bosses/check_for_bosses
execute if score L content_lock.timer1 matches 18 run function content_lock:mobs/chance_to_turn_into_boss/tick

function content_lock:mobs/entities/tick

execute if score L content_lock.timer1 matches 4 if predicate content_lock:day_begins run function content_lock:mobs/passives/check_for_wandering_trader_spawn