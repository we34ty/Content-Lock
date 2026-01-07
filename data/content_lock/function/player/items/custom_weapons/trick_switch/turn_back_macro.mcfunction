$execute if items entity @s weapon.mainhand $(item_type) run data modify storage content_lock:saved_stats item_type set from entity @s SelectedItem.components."minecraft:custom_data"."content_lock:item_for_switch"
$execute if items entity @s weapon.mainhand $(item_type) run return run function content_lock:player/items/custom_weapons/trick_switch/turn_back_macro with storage content_lock:saved_stats

$summon armor_stand ~ ~ ~ {Tags:["content_lock.trick_switch.temp_holder"],Invisible:1b,NoGravity:1b,Marker:1b,equipment:{mainhand:{id:"$(item_type)"}}}
data modify entity @n[tag=content_lock.trick_switch.temp_holder] equipment.mainhand.components merge from entity @s SelectedItem.components
item replace entity @s weapon.mainhand from entity @n[tag=content_lock.trick_switch.temp_holder] weapon.mainhand content_lock:trick_switch_back
execute if items entity @n[tag=content_lock.trick_switch.temp_holder] weapon.mainhand mace run item replace entity @s weapon.mainhand from entity @n[tag=content_lock.trick_switch.temp_holder] weapon.mainhand content_lock:trick_switch_mace
kill @n[tag=content_lock.trick_switch.temp_holder]