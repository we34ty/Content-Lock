$execute if score @s content_lock.temp3 matches ..0 run return run data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E087","shadow_color": 0}'}

function content_lock:player/effects/stamina_segments_empty with storage content_lock:saved_stats