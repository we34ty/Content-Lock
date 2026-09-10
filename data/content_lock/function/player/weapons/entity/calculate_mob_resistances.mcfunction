$data merge storage content_lock:saved_stats {UUID:$(UUID),damage_resistance:{},status_resistance:{}, damage_type:"$(damage_type)", physical_damage: $(physical_damage), fire_damage: $(fire_damage), frost_damage: $(frost_damage), magic_damage: $(magic_damage), wither_damage: $(wither_damage), ender_damage: $(ender_damage), bleed_status: $(bleed_status), poison_status: $(poison_status), corruption_status: $(corruption_status), wither_status: $(wither_status), frostbite_status: $(frostbite_status)}

data remove storage content_lock:saved_stats cached_armor
data merge storage content_lock:saved_stats {cached_armor:[{},{},{},{}]}
data modify storage content_lock:saved_stats cached_armor[0] merge from entity @s equipment.feet.components."minecraft:custom_data"."content_lock:armor"
data modify storage content_lock:saved_stats cached_armor[1] merge from entity @s equipment.legs.components."minecraft:custom_data"."content_lock:armor"
data modify storage content_lock:saved_stats cached_armor[2] merge from entity @s equipment.chest.components."minecraft:custom_data"."content_lock:armor"
data modify storage content_lock:saved_stats cached_armor[3] merge from entity @s equipment.head.components."minecraft:custom_data"."content_lock:armor"

data merge storage content_lock:saved_stats {damage_resistances:{},status_effect_resistances:{}}
function content_lock:player/weapons/entity/calculate_resistance {path:"physical"}
function content_lock:player/weapons/entity/calculate_resistance {path:"fire"}
function content_lock:player/weapons/entity/calculate_resistance {path:"frost"}
function content_lock:player/weapons/entity/calculate_resistance {path:"magic"}
function content_lock:player/weapons/entity/calculate_resistance {path:"wither"}
function content_lock:player/weapons/entity/calculate_resistance {path:"ender"}

function content_lock:player/weapons/entity/calculate_status_resistance {path:"bleed"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"poison"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"corruption"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"wither"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"frostbite"}

$execute at @n[nbt={UUID:$(UUID)}] run function content_lock:player/weapons/entity/damage_all with storage content_lock:saved_stats