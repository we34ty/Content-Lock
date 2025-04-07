execute if score @r content_lock.time_since_rest matches 1..20 if predicate content_lock:is_day run function content_lock:player/passives/night_skipped_check
execute if score @r content_lock.time_since_rest matches 0 if score L content_lock.nights_skipped_in_a_row matches 6.. as @a[scores={content_lock.time_since_rest=0}] at @s run function content_lock:player/passives/phantom_on_sleep
execute if score L2 content_lock.nights_skipped_in_a_row matches 1 if score L content_lock.nights_skipped_in_a_row matches ..5 run function content_lock:player/passives/too_many_skipped_nights_end with storage content_lock:saved_stats
execute if score L content_lock.nights_skipped_in_a_row matches 1.. if predicate content_lock:day_begins run scoreboard players remove L content_lock.nights_skipped_in_a_row 1

