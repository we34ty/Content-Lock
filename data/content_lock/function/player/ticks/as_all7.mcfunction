execute if score @s[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0 if score L content_lock.nights_skipped_in_a_row matches 6.. at @s run function content_lock:player/passives/sleep/phantom_on_sleep
execute if score @s[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0 unless score L content_lock.nights_skipped_in_a_row matches 6.. at @s run function content_lock:player/passives/sleep/sleeping
execute if score @s[scores={content_lock.time_since_death=21..},tag=content_lock.level_up_menu_up] content_lock.time_since_rest matches 1.. run function content_lock:player/passives/sleep/woke_up

function content_lock:player/levels/check_level
function content_lock:player/passives/round_health

function content_lock:player/passives/random_sounds/tick
execute if entity @s[tag=content_lock.spectator] unless entity @r[tag=!content_lock.spectator] run function content_lock:mobs/bosses/turn_off_spectator
execute if entity @s[tag=content_lock.spectator] unless entity @n[tag=content_lock.boss] run function content_lock:mobs/bosses/turn_off_spectator
execute if entity @s[tag=content_lock.spectator] if entity @n[tag=content_lock.boss] run function content_lock:mobs/bosses/spectator_counter
execute if entity @s[tag=content_lock.turn_to_spectator_after_death] unless entity @n[tag=content_lock.boss] run tag @s remove content_lock.turn_to_spectator_after_death

execute if score @s content_lock.flawless_countdown matches 1.. at @s run function content_lock:player/enchantments/flawless_countdown

execute if entity @s[team=content_lock.invisibility] run team leave @s
execute if entity @s[nbt={active_effects:[{id:"minecraft:invisibility"}]}] run team join content_lock.invisibility
execute at @s if dimension content_lock:the_void run function content_lock:player/passives/in_void

execute at @s if entity @n[type=item,distance=..10,tag=!content_lock.shimmered] as @e[type=item,distance=..10,tag=!content_lock.shimmered] at @s if predicate content_lock:underground_pond if block ~ ~ ~ #water_filled run function content_lock:player/shimmer/check

execute at @s if entity @n[type=villager,distance=..40,tag=!content_lock.villager_modified] as @e[type=villager,distance=..40,tag=!content_lock.villager_modified] run function content_lock:player/passives/modify_villagers/check

execute if entity @s[scores={content_lock.enchantment.lightstruck=1..}] run scoreboard players remove @s content_lock.enchantment.lightstruck 1