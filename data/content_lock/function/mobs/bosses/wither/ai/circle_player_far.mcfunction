execute if entity @p[distance=..1.4] run function content_lock:bosses/wither/ai/circle_player_way_too_close
execute if entity @p[distance=1.5..9.9] run function content_lock:bosses/wither/ai/circle_player_too_close
execute if entity @p[distance=10..] run function content_lock:bosses/wither/ai/circle_player_too_far