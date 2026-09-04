data merge storage content_lock:saved_stats {damage:{damage_type:0,physical:0,fire:0,frost:0,magic:0,wither:0,ender:0},status_effects:{bleed:0,poison:0,corruption:0,wither:0,frostbite:0}}
$data merge storage content_lock:saved_stats {damage_type:"$(damage_type)",physical_damage:$(physical_damage),fire_damage:$(fire_damage),frost_damage:$(frost_damage),magic_damage:$(magic_damage),wither_damage:$(wither_damage),ender_damage:$(ender_damage),bleed_status:$(bleed_status),poison_status:$(poison_status),corruption_status:$(corruption_status),wither_status:$(wither_status),frostbite_status:$(frostbite_status)}
scoreboard players set @s content_lock.temp3 0

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