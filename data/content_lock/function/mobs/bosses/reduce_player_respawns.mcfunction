tag @s add content_lock.spectator
gamemode spectator @s
scoreboard players remove @s content_lock.corruption_meter 2

data merge storage content_lock:saved_stats {x:0,y:63,z:0}
execute store result storage content_lock:saved_stats x double 1 run data get entity @s LastDeathLocation.pos[0]
execute store result storage content_lock:saved_stats y double 1 run data get entity @s LastDeathLocation.pos[1]
execute store result storage content_lock:saved_stats z double 1 run data get entity @s LastDeathLocation.pos[2]
function content_lock:player/passives/tp_macro with storage content_lock:saved_stats