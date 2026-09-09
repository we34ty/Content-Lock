data merge storage content_lock:weapon_stats {damage:{damage_type:0,physical:0,fire:0,frost:0,magic:0,wither:0,ender:0},status_effects:{bleed:0,poison:0,corruption:0,wither:0}}

data modify storage content_lock:saved_stats weapon_cache set from entity @s SelectedItem.components."minecraft:custom_data"."content_lock:weapon"
data modify storage content_lock:weapon_stats data.damage_type set from storage content_lock:saved_stats weapon_cache.damage_type
data modify storage content_lock:saved_stats damage_type set from storage content_lock:weapon_stats data.damage_type
scoreboard players set @s content_lock.temp3 0

$data merge storage content_lock:saved_stats {UUID:$(UUID),storage:"content_lock:saved_stats",path:"weapon",damage_modifier:{}}
function content_lock:player/passives/storage/player_data/load_path with storage content_lock:saved_stats

function content_lock:player/passives/damage/calculate_damage_macro {type:"physical"}
function content_lock:player/passives/damage/calculate_damage_macro {type:"fire"}
function content_lock:player/passives/damage/calculate_damage_macro {type:"frost"}
function content_lock:player/passives/damage/calculate_damage_macro {type:"magic"}
function content_lock:player/passives/damage/calculate_damage_macro {type:"wither"}
function content_lock:player/passives/damage/calculate_damage_macro {type:"ender"}

function content_lock:player/passives/damage/calculate_status_macro {type:"bleed"}
function content_lock:player/passives/damage/calculate_status_macro {type:"poison"}
function content_lock:player/passives/damage/calculate_status_macro {type:"corruption"}
function content_lock:player/passives/damage/calculate_status_macro {type:"wither"}
function content_lock:player/passives/damage/calculate_status_macro {type:"frostbite"}

execute store result storage content_lock:saved_stats display_checksum int 1 run scoreboard players get @s content_lock.temp3
