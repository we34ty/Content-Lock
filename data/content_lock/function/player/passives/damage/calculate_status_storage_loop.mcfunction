$data modify storage content_lock:saved_stats status_effect_modifier set from storage content_lock:saved_stats status_effect_modifiers.$(type)[$(i)]

$function content_lock:player/passives/damage/check_operation_status {damage_type:$(damage_type)}

scoreboard players operation @s content_lock.temp1 += @s content_lock.huhhealth1
scoreboard players operation @s content_lock.temp2 += @s content_lock.huhhealth2

#tellraw @a ["",{"text":"player temp1: ","color":"yellow"},{"score":{"name":"@s","objective":"content_lock.temp1"},"color":"white"},{"text":" temp2: ","color":"yellow"},{"score":{"name":"@s","objective":"content_lock.temp2"},"color":"white"}]

scoreboard players remove @s content_lock.timer1 1
execute unless score @s content_lock.timer1 matches 0.. run return 0

execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
function content_lock:player/passives/damage/calculate_status_storage_loop with storage content_lock:saved_stats
