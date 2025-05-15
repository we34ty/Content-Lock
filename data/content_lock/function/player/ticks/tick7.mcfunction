execute if score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0..19 if predicate content_lock:is_day run function content_lock:player/passives/sleep/night_skipped_check
execute if score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0 if score L content_lock.nights_skipped_in_a_row matches 6.. as @a[scores={content_lock.time_since_rest=0,content_lock.time_since_death=21..}] at @s run function content_lock:player/passives/sleep/phantom_on_sleep
execute if score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0 unless score L content_lock.nights_skipped_in_a_row matches 6.. as @a[scores={content_lock.time_since_rest=0,content_lock.time_since_death=21..}] at @s run function content_lock:player/passives/sleep/sleeping
execute if score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 1..20 as @a[scores={content_lock.time_since_rest=1..20,content_lock.time_since_death=21..}] run function content_lock:player/passives/sleep/woke_up
execute if score L2 content_lock.nights_skipped_in_a_row matches 1 if score L content_lock.nights_skipped_in_a_row matches ..5 run function content_lock:player/passives/sleep/too_many_skipped_nights_end with storage content_lock:saved_stats
execute if score L content_lock.nights_skipped_in_a_row matches 1.. if predicate content_lock:day_begins unless score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0..19 run scoreboard players remove L content_lock.nights_skipped_in_a_row 1

function content_lock:player/passives/night_time_management
execute as @a run function content_lock:player/passives/random_sounds/tick
execute if entity @r[tag=content_lock.spectator] unless entity @e[tag=content_lock.boss] as @a[tag=content_lock.spectator] run function content_lock:mobs/bosses/turn_off_spectator
execute if entity @r[tag=content_lock.turn_to_spectator_after_death] unless entity @e[tag=content_lock.boss] as @a[tag=content_lock.turn_to_spectator_after_death] run tag @s remove content_lock.turn_to_spectator_after_death

execute if score @r content_lock.flawless_countdown matches 1.. as @a[scores={content_lock.flawless_countdown=1..}] at @s run function content_lock:player/enchantments/flawless_countdown