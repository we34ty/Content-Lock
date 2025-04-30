execute store result score @s content_lock.temp1 run time query daytime

data merge storage content_lock:saved_stats {time:E054}
execute if score @s content_lock.temp1 matches 17000..19999 run data merge storage content_lock:saved_stats {time:E054}
execute if score @s content_lock.temp1 matches 20000..21999 run data merge storage content_lock:saved_stats {time:E055}
execute if score @s content_lock.temp1 matches 22000..24000 run data merge storage content_lock:saved_stats {time:E056}
execute if score @s content_lock.temp1 matches 0..999 run data merge storage content_lock:saved_stats {time:E057}
execute if score @s content_lock.temp1 matches 1000..3999 run data merge storage content_lock:saved_stats {time:E058}
execute if score @s content_lock.temp1 matches 4000..8999 run data merge storage content_lock:saved_stats {time:E049}
execute if score @s content_lock.temp1 matches 9000..10999 run data merge storage content_lock:saved_stats {time:E050}
execute if score @s content_lock.temp1 matches 11000..12999 run data merge storage content_lock:saved_stats {time:E051}
execute if score @s content_lock.temp1 matches 13000..14999 run data merge storage content_lock:saved_stats {time:E052}
execute if score @s content_lock.temp1 matches 15000..16999 run data merge storage content_lock:saved_stats {time:E053}

data merge storage content_lock:saved_stats {nights_skipped:E067}
execute if score L content_lock.nights_skipped_in_a_row matches 1 run data merge storage content_lock:saved_stats {nights_skipped:E061}
execute if score L content_lock.nights_skipped_in_a_row matches 2 run data merge storage content_lock:saved_stats {nights_skipped:E062}
execute if score L content_lock.nights_skipped_in_a_row matches 3 run data merge storage content_lock:saved_stats {nights_skipped:E063}
execute if score L content_lock.nights_skipped_in_a_row matches 4 run data merge storage content_lock:saved_stats {nights_skipped:E064}
execute if score L content_lock.nights_skipped_in_a_row matches 5 run data merge storage content_lock:saved_stats {nights_skipped:E065}
execute if score L content_lock.nights_skipped_in_a_row matches 6.. run data merge storage content_lock:saved_stats {nights_skipped:E066}
execute if score L content_lock.options.player.sleep_exhaustion matches 0 run data merge storage content_lock:saved_stats {nights_skipped:E060}