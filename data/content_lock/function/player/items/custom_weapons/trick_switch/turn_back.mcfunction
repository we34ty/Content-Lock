data merge storage content_lock:saved_stats {item_type:"dirt"}
data modify storage content_lock:saved_stats item_type set from entity @s SelectedItem.components."minecraft:custom_data"."content_lock:item_type"

function content_lock:player/items/custom_weapons/trick_switch/turn_back_macro with storage content_lock:saved_stats

playsound item.spear.attack player @a ~ ~ ~ 1 0.5