$data merge storage content_lock:saved_stats {UUID:$(UUID), damage_type:"$(damage_type)", physical_damage: $(physical_damage), fire_damage: $(fire_damage), frost_damage: $(frost_damage), magic_damage: $(magic_damage), wither_damage: $(wither_damage), ender_damage: $(ender_damage), bleed_status: $(bleed_status), poison_status: $(poison_status), corruption_status: $(corruption_status), wither_status: $(wither_status), frostbite_status: $(frostbite_status)}

data modify storage content_lock:saved_stats cached_armor set value []
data modify storage content_lock:saved_stats cached_armor append from entity @s Inventory[{Slot:100b}].components."minecraft:custom_data"."content_lock:armor"
data modify storage content_lock:saved_stats cached_armor append from entity @s Inventory[{Slot:101b}].components."minecraft:custom_data"."content_lock:armor"
data modify storage content_lock:saved_stats cached_armor append from entity @s Inventory[{Slot:102b}].components."minecraft:custom_data"."content_lock:armor"
data modify storage content_lock:saved_stats cached_armor append from entity @s Inventory[{Slot:103b}].components."minecraft:custom_data"."content_lock:armor"

function content_lock:player/weapons/entity/calculate_resistance {path:"physical_damage"}
function content_lock:player/weapons/entity/calculate_resistance {path:"fire_damage"}
function content_lock:player/weapons/entity/calculate_resistance {path:"frost_damage"}
function content_lock:player/weapons/entity/calculate_resistance {path:"magic_damage"}
function content_lock:player/weapons/entity/calculate_resistance {path:"wither_damage"}
function content_lock:player/weapons/entity/calculate_resistance {path:"ender_damage"}

function content_lock:player/weapons/entity/calculate_status_resistance {path:"bleed_status"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"poison_status"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"corruption_status"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"wither_status"}
function content_lock:player/weapons/entity/calculate_status_resistance {path:"frostbite_status"}

$execute at @n[nbt={UUID:$(UUID)}] run function content_lock:player/weapons/entity/damage_all with storage content_lock:saved_stats