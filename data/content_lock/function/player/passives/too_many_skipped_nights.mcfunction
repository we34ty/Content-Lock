data merge storage content_lock:saved_stats {playersSleepingPercentage:100}
execute store result storage content_lock:saved_stats playersSleepingPercentage int 1 run gamerule playersSleepingPercentage
gamerule playersSleepingPercentage 101
scoreboard players add L content_lock.nights_skipped_in_a_row 2
scoreboard players set L2 content_lock.nights_skipped_in_a_row 1
tellraw @a {"translate":"content_lock:notifications.too_many_skipped_nights","color":"red"}