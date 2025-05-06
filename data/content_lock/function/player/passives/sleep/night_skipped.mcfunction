execute if score L content_lock.options.player.leveling matches 0 run return 0 

scoreboard players add L content_lock.nights_skipped_in_a_row 1

execute if score L content_lock.nights_skipped_in_a_row matches 2.. run scoreboard players remove @a[scores={content_lock.corruption_meter=1..}] content_lock.corruption_meter 1
execute if score L content_lock.nights_skipped_in_a_row matches 2 run scoreboard players set L content_lock.temp1 2000
execute if score L content_lock.nights_skipped_in_a_row matches 3 run scoreboard players set L content_lock.temp1 4000
execute if score L content_lock.nights_skipped_in_a_row matches 4 run scoreboard players set L content_lock.temp1 6000
execute if score L content_lock.nights_skipped_in_a_row matches 5 run scoreboard players set L content_lock.temp1 8000
execute if score L content_lock.nights_skipped_in_a_row matches 6 run scoreboard players set L content_lock.temp1 10000
execute if score L content_lock.nights_skipped_in_a_row matches 6 run function content_lock:player/passives/sleep/too_many_skipped_nights

execute if score L content_lock.nights_skipped_in_a_row matches 2.. run data merge storage content_lock:saved_stats {value:0}
execute if score L content_lock.nights_skipped_in_a_row matches 2.. store result storage content_lock:saved_stats value int 1 run scoreboard players get L content_lock.temp1
execute if score L content_lock.nights_skipped_in_a_row matches 2.. run function content_lock:player/passives/sleep/skip_time_macro with storage content_lock:saved_stats

effect give @s instant_health 1 100 true
#say lol