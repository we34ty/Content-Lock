$gamerule playersSleepingPercentage $(playersSleepingPercentage)
scoreboard players set L2 content_lock.nights_skipped_in_a_row 0
#tellraw @a {"translate":"content_lock:notifications.too_many_skipped_nights_end","color":"lime"}