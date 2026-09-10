##Transfer some of the information to the projectile array, such as projectile Id, player UUID, damage, distance from player and rotation info (which is stored as bytes).
data merge storage content_lock:weapon_stats {Id:0,data:{UUID:[I;0,0,0,0],damage_type:"melee",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}}
data merge storage content_lock:weapon_stats {UUID:[I;0,0,0,0],damage_type:"melee",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
data modify storage content_lock:weapon_stats data.UUID set from entity @s UUID

##Calculate all of the damage values of the weapon and store them in the projectile array
data merge storage content_lock:saved_stats {storage:"content_lock:saved_stats",path:"weapon_runtime",UUID:[I;0,0,0,0]}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/passives/storage/player_data/load_path with storage content_lock:saved_stats
function content_lock:player/passives/damage/calculate_damage with storage content_lock:saved_stats

scoreboard players set @s content_lock.temp3 -1
execute store result score @s content_lock.temp3 run data get storage content_lock:saved_stats lore_checksum 1

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats display_checksum 1

execute unless score @s content_lock.temp1 = @s content_lock.temp3 run function content_lock:player/weapons/update_lore

tag @s add content_lock.weapons.attacking
execute at @s as @e[type=!#entities,distance=..40] run function content_lock:player/weapons/detect_whos_attacked with storage content_lock:weapon_stats data
tag @s remove content_lock.weapons.attacking
say L