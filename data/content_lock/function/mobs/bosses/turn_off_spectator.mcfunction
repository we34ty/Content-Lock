tag @s remove content_lock.spectator
gamemode survival @s

data merge storage content_lock:saved_stats {x:0,y:63,z:0}
execute store result storage content_lock:saved_stats x double 1 run data get entity @s SpawnX
execute store result storage content_lock:saved_stats y double 1 run data get entity @s SpawnY
execute store result storage content_lock:saved_stats z double 1 run data get entity @s SpawnZ
function content_lock:player/passives/tp_macro with storage content_lock:saved_stats