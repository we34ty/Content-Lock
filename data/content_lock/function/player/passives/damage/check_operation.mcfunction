scoreboard players set @s content_lock.huhhealth1 0
scoreboard players set @s content_lock.huhhealth2 0
execute unless data storage content_lock:saved_stats damage_modifier.type if data storage content_lock:saved_stats {damage_modifier:{operation:"multiply"}} store result score @s content_lock.huhhealth2 run return run data get storage content_lock:saved_stats damage_modifier.value 1000
execute unless data storage content_lock:saved_stats damage_modifier.type if data storage content_lock:saved_stats {damage_modifier:{operation:"add"}} store result score @s content_lock.huhhealth1 run return run data get storage content_lock:saved_stats damage_modifier.value 1000
$execute if data storage content_lock:saved_stats {damage_modifier:{operation:"multiply",type:"$(damage_type)"}} store result score @s content_lock.huhhealth2 run return run data get storage content_lock:saved_stats damage_modifier.value 1000
$execute if data storage content_lock:saved_stats {damage_modifier:{operation:"add",type:"$(damage_type)"}} store result score @s content_lock.huhhealth1 run return run data get storage content_lock:saved_stats damage_modifier.value 1000
