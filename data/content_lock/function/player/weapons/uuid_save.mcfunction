scoreboard players add L content_lock.UUID_id 1
scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
data merge storage content_lock:weapon_stats {Id:0,data:{UUID:[I;0,0,0,0],damage:0,distance:0,pitch:0b,yaw:0b}}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
data modify storage content_lock:weapon_stats data.UUID set from entity @s UUID
execute store result storage content_lock:weapon_stats data.damage float 1 run attribute @s attack_damage get
data modify storage content_lock:weapon_stats data.distance set from storage content_lock:weapon_stats distance
execute store result storage content_lock:weapon_stats data.yaw byte 0.7 run data get entity @n[tag=content_lock.weapons.attacking] Rotation[0]
execute store result storage content_lock:weapon_stats data.pitch byte 1 run data get entity @n[tag=content_lock.weapons.attacking] Rotation[1]

function content_lock:player/passives/uuid_id_save with storage content_lock:weapon_stats

execute if score L content_lock.UUID_id >= L content_lock.UUID_id.max run scoreboard players set L content_lock.UUID_id 0