tag @s remove content_lock.spectator
gamemode survival @s

data merge storage content_lock:saved_stats {x:0,y:63,z:0}
execute store result storage content_lock:saved_stats x double 1 run data get entity @s respawn.pos[0]
execute store result storage content_lock:saved_stats y double 1 run data get entity @s respawn.pos[1]
execute store result storage content_lock:saved_stats z double 1 run data get entity @s respawn.pos[2]
execute store result storage content_lock:saved_stats dimension double 1 run data get entity @s respawn.dimension
function content_lock:player/passives/tp_macro with storage content_lock:saved_stats