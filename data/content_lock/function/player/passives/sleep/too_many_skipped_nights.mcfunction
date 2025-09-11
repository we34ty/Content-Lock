execute if entity @r[tag=content_lock.level_up_menu_up,tag=!content_lock.level_up_menu_down] run function content_lock:player/passives/sleep/enable_sleeping with storage content_lock:saved_stats
function content_lock:player/passives/sleep/disable_sleeping
scoreboard players add L content_lock.nights_skipped_in_a_row 2
scoreboard players set L2 content_lock.nights_skipped_in_a_row 1
tellraw @a [{"translate":"content_lock:notifications.too_many_skipped_nights","color":"red"}]
advancement grant @a only content_lock:adventure/lazy