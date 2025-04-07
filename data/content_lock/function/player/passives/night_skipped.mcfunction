scoreboard players add L content_lock.nights_skipped_in_a_row 1

execute if score L content_lock.nights_skipped_in_a_row matches 2 run time set 2000
execute if score L content_lock.nights_skipped_in_a_row matches 3 run time set 4000
execute if score L content_lock.nights_skipped_in_a_row matches 4 run time set 6000
execute if score L content_lock.nights_skipped_in_a_row matches 5 run time set 8000
execute if score L content_lock.nights_skipped_in_a_row matches 6 run time set 10000
execute if score L content_lock.nights_skipped_in_a_row matches 6 run function content_lock:player/passives/too_many_skipped_nights

#say lol