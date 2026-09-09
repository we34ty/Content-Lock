
$data modify storage content_lock:saved_stats status_resistance set from storage content_lock:saved_stats cached_armor[$(slot)].status_resistance_modifiers.$(path)[$(i)]

scoreboard players set @s content_lock.huhhealth1 0
scoreboard players set @s content_lock.huhhealth2 0
execute if data storage content_lock:saved_stats {status_resistance:{operation:"multiply"}} store result score @s content_lock.huhhealth2 run return run data get storage content_lock:saved_stats status_resistance.value 1000
execute if data storage content_lock:saved_stats {status_resistance:{operation:"add"}} store result score @s content_lock.huhhealth1 run return run data get storage content_lock:saved_stats status_resistance.value 1000

scoreboard players operation @s content_lock.temp2 += @s content_lock.huhhealth1
scoreboard players operation @s content_lock.temp3 += @s content_lock.huhhealth2

scoreboard players remove @s content_lock.timer1 1
execute unless score @s content_lock.timer1 matches 0.. run return 0

execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
function content_lock:player/weapons/entity/calculate_armor_status_resistance_loop with storage content_lock:saved_stats
