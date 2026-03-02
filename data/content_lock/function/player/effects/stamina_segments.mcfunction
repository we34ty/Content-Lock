scoreboard players remove @s content_lock.temp2 1

execute if score @s content_lock.temp2 matches ..0 run return run function content_lock:player/effects/stamina_segments_empty_check with storage content_lock:saved_stats

$data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E085","shadow_color": 0}'}

function content_lock:player/effects/stamina_segments with storage content_lock:saved_stats