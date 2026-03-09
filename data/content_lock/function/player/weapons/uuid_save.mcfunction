##Transfer some of the information to the projectile array, such as projectile Id, player UUID, damage, distance from player and rotation info (which is stored as bytes).
scoreboard players add L content_lock.UUID_id 1
scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
data merge storage content_lock:weapon_stats {Id:0,data:{UUID:[I;0,0,0,0],damage_type:"melee",distance:0,pitch:0b,yaw:0b,physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
data modify storage content_lock:weapon_stats data.UUID set from entity @s UUID

##Calculate all of the damage values of the weapon and store them in the projectile array
data merge storage content_lock:saved_stats {display:{physical:0,fire:0,frost:0,magic:0,wither:0,ender:0}}
function content_lock:player/passives/damage/calculate_damage with storage content_lock:weapon_stats
execute store result storage content_lock:saved_stats display.physical int 1 run data get storage content_lock:weapon_stats data.physical_damage 10
execute store result storage content_lock:saved_stats display.fire int 1 run data get storage content_lock:weapon_stats data.fire_damage 10
execute store result storage content_lock:saved_stats display.frost int 1 run data get storage content_lock:weapon_stats data.frost_damage 10
execute store result storage content_lock:saved_stats display.magic int 1 run data get storage content_lock:weapon_stats data.magic_damage 10
execute store result storage content_lock:saved_stats display.wither int 1 run data get storage content_lock:weapon_stats data.wither_damage 10
execute store result storage content_lock:saved_stats display.ender int 1 run data get storage content_lock:weapon_stats data.ender_damage 10
item modify entity @s weapon.mainhand content_lock:weapon_update_stats

data modify storage content_lock:weapon_stats data.distance set from storage content_lock:weapon_stats distance
execute store result storage content_lock:weapon_stats data.yaw byte 0.7 run data get entity @n[tag=content_lock.weapons.attacking] Rotation[0]
execute store result storage content_lock:weapon_stats data.pitch byte 1 run data get entity @n[tag=content_lock.weapons.attacking] Rotation[1]

##Use this function to add values to the projectile array
function content_lock:player/passives/storage/uuid_id/save with storage content_lock:weapon_stats

execute if score L content_lock.UUID_id >= L content_lock.UUID_id.max run scoreboard players set L content_lock.UUID_id 0