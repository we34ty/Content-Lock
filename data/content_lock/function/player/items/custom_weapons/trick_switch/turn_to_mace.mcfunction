summon armor_stand ~ ~ ~ {Tags:["content_lock.trick_switch.temp_holder"],Invisible:1b,NoGravity:1b,Marker:1b,equipment:{mainhand:{id:"mace"}}}
data modify entity @n[tag=content_lock.trick_switch.temp_holder] equipment.mainhand.components merge from entity @s SelectedItem.components
data modify entity @n[tag=content_lock.trick_switch.temp_holder] equipment.mainhand.components."minecraft:custom_data"."content_lock:item_type" set from entity @s SelectedItem.id
item replace entity @s weapon.mainhand from entity @n[tag=content_lock.trick_switch.temp_holder] weapon.mainhand content_lock:trick_switch_mace

playsound item.spear.attack player @a ~ ~ ~ 1 0.5
kill @n[tag=content_lock.trick_switch.temp_holder]