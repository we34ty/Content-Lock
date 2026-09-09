$data merge storage content_lock:saved_stats {name: $(name)}
execute if entity @s[type=player] run return run function content_lock:player/weapons/entity/remove/player with storage content_lock:saved_stats
function content_lock:player/weapons/entity/remove/mob with storage content_lock:saved_stats