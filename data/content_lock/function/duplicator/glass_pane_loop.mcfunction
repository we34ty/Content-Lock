data merge storage content_lock:saved_stats {slot:0,model:"content_lock:duplicator_main"}
execute if score @s content_lock.timer1 matches 0 run data merge storage content_lock:saved_stats {slot:0,model:"content_lock:duplicator_display"}
execute if score @s content_lock.timer1 matches 18 run data merge storage content_lock:saved_stats {slot:0,model:"content_lock:duplicator_display"}
execute if score @s content_lock.timer1 matches 9 run data merge storage content_lock:saved_stats {slot:0,model:"content_lock:duplicator_vertical"}
execute if score @s content_lock.timer1 matches 13 run data merge storage content_lock:saved_stats {slot:0,model:"content_lock:duplicator_arrow"}
execute unless items block ~ ~ ~ container.11 * if score @s content_lock.timer1 matches 10 run data merge storage content_lock:saved_stats {slot:0,model:"content_lock:duplicator_icons"}
execute store result storage content_lock:saved_stats slot int 1 run scoreboard players get @s content_lock.timer1
execute unless score @s content_lock.timer1 matches 1..3 unless score @s content_lock.timer1 matches 19..21 unless score @s content_lock.timer1 matches 11 unless score @s content_lock.timer1 matches 15 run function content_lock:duplicator/gui_macro with storage content_lock:saved_stats
execute if score @s content_lock.timer1 matches 15 run function content_lock:duplicator/result_macro with storage content_lock:saved_stats
execute if score @s content_lock.timer1 matches 1..3 run function content_lock:duplicator/glass_pane_macro with storage content_lock:saved_stats
execute if score @s content_lock.timer1 matches 19..21 run function content_lock:duplicator/glass_pane_macro with storage content_lock:saved_stats


scoreboard players add @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 27.. run scoreboard players set @s content_lock.timer1 0