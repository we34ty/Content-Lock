execute if score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0..19 if predicate content_lock:is_day run function content_lock:player/passives/sleep/night_skipped_check
execute as @a run function content_lock:player/ticks/as_all7
execute if score L2 content_lock.nights_skipped_in_a_row matches 1 if score L content_lock.nights_skipped_in_a_row matches ..5 run function content_lock:player/passives/sleep/too_many_skipped_nights_end with storage content_lock:saved_stats
execute if score L content_lock.nights_skipped_in_a_row matches 1.. if predicate content_lock:day_begins unless score @r[scores={content_lock.time_since_death=21..}] content_lock.time_since_rest matches 0..19 run scoreboard players remove L content_lock.nights_skipped_in_a_row 1

function content_lock:player/passives/night_time_management