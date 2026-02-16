scoreboard players add L content_lock.UUID_id 1
execute store result score @s content_lock.UUID_id run scoreboard players get L content_lock.UUID_id
data merge storage content_lock:weapon_stats {Id:0,data:{UUID:[I;0,0,0,0],damage:0,distance:0,rotation:0}}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
data modify storage content_lock:weapon_stats data.UUID set from entity @s UUID
execute store result storage content_lock:weapon_stats data.damage float 1 run attribute @s attack_damage get
data modify storage content_lock:weapon_stats data.distance set from storage content_lock:weapon_stats distance
execute store result storage content_lock:weapon_stats data.rotation int 1 run data get entity @n[tag=content_lock.weapons.attacking] Rotation[0]

function content_lock:player/passives/uuid_id_save with storage content_lock:weapon_stats

execute if score L content_lock.UUID_id matches 200.. run scoreboard players set L content_lock.UUID_id 0