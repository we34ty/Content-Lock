scoreboard players remove @s content_lock.temp3 1

$data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E084","shadow_color": 0}'}

execute if score @s content_lock.temp3 matches ..0 run return run function content_lock:player/effects/stamina_segments_empty_last with storage content_lock:saved_stats

function content_lock:player/effects/stamina_segments_empty with storage content_lock:saved_stats