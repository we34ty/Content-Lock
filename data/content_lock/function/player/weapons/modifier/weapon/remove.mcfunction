$data merge storage content_lock:saved_stats {name: $(name)}
execute if entity @s[type=player] run return run function content_lock:player/weapons/modifier/weapon/remove/player with storage content_lock:saved_stats
function content_lock:player/weapons/modifier/weapon/remove/mob with storage content_lock:saved_stats