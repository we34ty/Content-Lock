data merge storage content_lock:saved_stats {display:{physical:0,fire:0,frost:0,magic:0,wither:0,ender:0,bleed:0,poison:0,corruption:0,wither_status:0,frostbite:0}}
execute store result storage content_lock:saved_stats display.physical int 1 run data get storage content_lock:weapon_stats data.physical_damage 10
execute store result storage content_lock:saved_stats display.fire int 1 run data get storage content_lock:weapon_stats data.fire_damage 10
execute store result storage content_lock:saved_stats display.frost int 1 run data get storage content_lock:weapon_stats data.frost_damage 10
execute store result storage content_lock:saved_stats display.magic int 1 run data get storage content_lock:weapon_stats data.magic_damage 10
execute store result storage content_lock:saved_stats display.wither int 1 run data get storage content_lock:weapon_stats data.wither_damage 10
execute store result storage content_lock:saved_stats display.ender int 1 run data get storage content_lock:weapon_stats data.ender_damage 10
execute store result storage content_lock:saved_stats display.bleed int 1 run data get storage content_lock:weapon_stats data.bleed_status 0.01
execute store result storage content_lock:saved_stats display.poison int 1 run data get storage content_lock:weapon_stats data.poison_status 0.01
execute store result storage content_lock:saved_stats display.corruption int 1 run data get storage content_lock:weapon_stats data.corruption_status 0.01
execute store result storage content_lock:saved_stats display.wither_status int 1 run data get storage content_lock:weapon_stats data.wither_status 0.01
execute store result storage content_lock:saved_stats display.frostbite int 1 run data get storage content_lock:weapon_stats data.frostbite_status 0.01

item modify entity @s weapon.mainhand content_lock:weapon_update_stats
data merge storage content_lock:saved_stats {storage:"content_lock:saved_stats",path:"weapon_runtime",data:{lore_checksum:0}}
execute store result storage content_lock:saved_stats data.lore_checksum int 1 run scoreboard players get @s content_lock.temp1
function content_lock:player/passives/storage/player_data/save_path with storage content_lock:saved_stats
data remove storage content_lock:saved_stats data