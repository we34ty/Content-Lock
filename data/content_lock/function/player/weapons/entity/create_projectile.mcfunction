##Transfer some of the information to the projectile array, such as projectile Id, player UUID and damage
scoreboard players add L content_lock.UUID_id 1
scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
$data merge storage content_lock:weapon_stats {Id:0,data:{UUID:[I;0,0,0,0],Owner:$(Owner),damage_type:$(damage_type),physical_damage:$(physical_damage),fire_damage:$(fire_damage),frost_damage:$(frost_damage),magic_damage:$(magic_damage),wither_damage:$(wither_damage),ender_damage:$(ender_damage),bleed_status:$(bleed_status),poison_status:$(poison_status),corruption_status:$(corruption_status),wither_status:$(wither_status),frostbite_status:$(frostbite_status)}}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
data modify storage content_lock:weapon_stats data.UUID set from entity @s UUID

##Use this function to add values to the projectile array
function content_lock:player/passives/storage/uuid_id/save with storage content_lock:weapon_stats

execute if score L content_lock.UUID_id >= L content_lock.UUID_id.max run scoreboard players set L content_lock.UUID_id 0