scoreboard players remove @s content_lock.temp2 1
$execute if score @s content_lock.temp2 matches ..0 if score @s content_lock.temp3 matches ..0 run data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E087","shadow_color": 0}'}
execute unless score @s content_lock.temp2 matches 1.. unless score @s content_lock.temp3 matches 1.. run return 0
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp3 matches ..0 run return run function content_lock:player/effects/stamina_segments with storage content_lock:saved_stats
$execute if score @s content_lock.temp2 matches 1.. run data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E085","shadow_color": 0}'}
execute if score @s content_lock.temp2 matches 1.. run return run function content_lock:player/effects/stamina_segments with storage content_lock:saved_stats

scoreboard players remove @s content_lock.temp3 1
$execute if score @s content_lock.temp3 matches ..0 run return run data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E086","shadow_color": 0}'}
$execute if score @s content_lock.temp3 matches 1.. run data merge storage content_lock:saved_stats {stamina:'$(stamina),{"translate":"space.-1","fallback":""},{"translate":"content_lock:font.E084","shadow_color": 0}'}

function content_lock:player/effects/stamina_segments with storage content_lock:saved_stats