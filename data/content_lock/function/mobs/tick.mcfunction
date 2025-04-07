execute as @e[type=#can_scale,tag=!content_lock.progression_scaled,tag=!content_lock.progression_not_scaled,distance=0..40] at @s if entity @r[distance=0..40] run function content_lock:mobs/passives/progression_scaling
execute as @e[type=#hostile] at @s if entity @r[distance=0..40] run function content_lock:mobs/customization/tick
execute if score L content_lock.timer1 matches 16 at @a if entity @e[type=iron_golem,distance=0..40,limit=1,sort=random,tag=!content_lock.customized] as @e[type=iron_golem,distance=0..40,tag=!content_lock.customized] run function content_lock:mobs/customization/iron_golem
execute at @a if entity @e[type=experience_orb,distance=0..10,limit=1,sort=random] as @e[type=experience_orb,distance=0..10] run kill @s

execute if entity @e[tag=content_lock.splintered] as @e[tag=content_lock.splintered] run function content_lock:player/enchantments/splinter_countdown

#function content_lock:mobs/passives/shops/time_check_for_shop_refresh
function content_lock:mobs/bosses/check_for_bosses
