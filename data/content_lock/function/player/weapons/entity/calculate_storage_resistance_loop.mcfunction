
$data modify storage content_lock:saved_stats damage_resistance set from storage content_lock:weapon_stats damage_resistances.$(path)[$(i)]

scoreboard players set @s content_lock.huhhealth1 0
scoreboard players set @s content_lock.huhhealth2 0
execute if data storage content_lock:saved_stats {damage_resistance:{operation:"multiply"}} store result score @s content_lock.huhhealth2 run data get storage content_lock:saved_stats damage_resistance.value 1000
execute if data storage content_lock:saved_stats {damage_resistance:{operation:"add"}} store result score @s content_lock.huhhealth1 run data get storage content_lock:saved_stats damage_resistance.value 10

scoreboard players operation @s content_lock.temp2 += @s content_lock.huhhealth1
scoreboard players set @s content_lock.huhhealth1 1000
scoreboard players operation @s content_lock.huhhealth1 -= @s content_lock.huhhealth2
scoreboard players operation @s content_lock.temp3 *= @s content_lock.huhhealth1
scoreboard players set @s content_lock.huhhealth1 1000
scoreboard players operation @s content_lock.temp3 /= @s content_lock.huhhealth1

tellraw @s [{text:"Found modifier: ",color:"yellow"},{storage:"content_lock:saved_stats",nbt:"damage_resistance.value",color:"green"}]

scoreboard players remove @s content_lock.timer1 1
execute unless score @s content_lock.timer1 matches 0.. run return 0

execute store result storage content_lock:saved_stats i int 1 run scoreboard players get @s content_lock.timer1
function content_lock:player/weapons/entity/calculate_storage_resistance_loop with storage content_lock:saved_stats
