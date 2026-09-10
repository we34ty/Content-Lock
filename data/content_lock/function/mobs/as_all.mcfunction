execute if entity @s[type=dolphin,tag=content_lock.tatsugeki.dolphin] at @s run function content_lock:mobs/entities/tatsugeki/dolphin
function content_lock:mobs/bosses/check_for_bosses

execute if score L content_lock.options.enemy.scaling matches 1 if entity @s[type=#content_lock:can_scale,tag=!content_lock.progression_scaled,tag=!content_lock.progression_not_scaled,distance=..40] at @s run function content_lock:mobs/passives/progression_scaling
execute if score L content_lock.options.enemy.customization matches 1 if entity @s[type=#content_lock:customizable] at @s run function content_lock:mobs/customization/tick

execute if entity @s[tag=content_lock.splintered] run function content_lock:player/enchantments/splinter_countdown

execute if entity @s[tag=content_lock.carapacer] at @s run function content_lock:mobs/custom/carapacer/tick
execute if entity @s[tag=content_lock.carapacer,tag=content_lock.carapacer.taken_shape] run tag @s remove content_lock.carapacer.taken_shape

execute if entity @s[tag=content_lock.enchantment.bonus.armor.diamond.exclude] run tag @s remove content_lock.enchantment.bonus.armor.diamond.exclude