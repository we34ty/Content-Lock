data merge storage content_lock:saved_stats {damage:1.0f,range:1.0f,attack_speed:1,UUID:[]}
execute store result storage content_lock:saved_stats damage float 0.01 run attribute @s attack_damage get 100
execute store result storage content_lock:saved_stats range float 0.01 run attribute @s attack_knockback get 100
execute store result storage content_lock:saved_stats attack_speed int 1 run attribute @s attack_speed get 100
data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/items/spells/witchs_book with storage content_lock:saved_stats