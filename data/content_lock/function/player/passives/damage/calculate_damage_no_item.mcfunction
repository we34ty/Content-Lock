data remove storage content_lock:saved_stats weapon_cache
data merge storage content_lock:weapon_stats {Id:0,data:{UUID:[I;0,0,0,0],damage_type:"melee",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}}
data merge storage content_lock:saved_stats {damage:{damage_type:0,physical:0,fire:0,frost:0,magic:0,wither:0,ender:0},status_effects:{bleed:0,poison:0,corruption:0,wither:0,frostbite:0}}
$data merge storage content_lock:saved_stats {damage_type:"$(damage_type)",physical_damage:$(physical_damage),fire_damage:$(fire_damage),frost_damage:$(frost_damage),magic_damage:$(magic_damage),wither_damage:$(wither_damage),ender_damage:$(ender_damage),bleed_status:$(bleed_status),poison_status:$(poison_status),corruption_status:$(corruption_status),wither_status:$(wither_status),frostbite_status:$(frostbite_status)}
scoreboard players set @s content_lock.temp3 0
data modify storage content_lock:weapon_stats data.UUID set from storage content_lock:saved_stats UUID

$data merge storage content_lock:saved_stats {UUID:$(UUID),storage:"content_lock:saved_stats",path:"weapon",damage_modifier:{}}
function content_lock:player/passives/storage/player_data/load_path with storage content_lock:saved_stats

function content_lock:player/passives/damage/calculate_damage_no_item_macro {type:"physical"}
function content_lock:player/passives/damage/calculate_damage_no_item_macro {type:"fire"}
function content_lock:player/passives/damage/calculate_damage_no_item_macro {type:"frost"}
function content_lock:player/passives/damage/calculate_damage_no_item_macro {type:"magic"}
function content_lock:player/passives/damage/calculate_damage_no_item_macro {type:"wither"}
function content_lock:player/passives/damage/calculate_damage_no_item_macro {type:"ender"}

function content_lock:player/passives/damage/calculate_status_macro {type:"bleed"}
function content_lock:player/passives/damage/calculate_status_macro {type:"poison"}
function content_lock:player/passives/damage/calculate_status_macro {type:"corruption"}
function content_lock:player/passives/damage/calculate_status_macro {type:"wither"}
function content_lock:player/passives/damage/calculate_status_macro {type:"frostbite"}

#tellraw @a [{"text":"Damage Type: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.damage_type","color":"red"},{"text":", Physical Damage: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.physical_damage","color":"red"},{"text":", Fire Damage: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.fire_damage","color":"red"},{"text":", Frost Damage: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.frost_damage","color":"red"},{"text":", Magic Damage: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.magic_damage","color":"red"},{"text":", Wither Damage: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.wither_damage","color":"red"},{"text":", Ender Damage: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.ender_damage","color":"red"},{"text":", Bleed Status: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.bleed_status","color":"red"},{"text":", Poison Status: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.poison_status","color":"red"},{"text":", Corruption Status: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.corruption_status","color":"red"},{"text":", Wither Status: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.wither_status","color":"red"},{"text":", Frostbite Status: ","color":"gray"},{"storage":"content_lock:weapon_stats",nbt:"data.frostbite_status","color":"red"}]