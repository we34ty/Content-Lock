scoreboard players remove @s content_lock.enchantment.bonus.armor.chainmail.timer 1

## If the timer is not 0, return and do not remove the enchain effect
execute unless score @s content_lock.enchantment.bonus.armor.chainmail.timer matches 0 run return 0

## Remove the enchain effect from all hostile mobs within the range
execute if items entity @s armor.feet *[custom_data~{"content_lock:armor":{}}] run data remove entity @s Inventory[{Slot:100b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical[{name:"content_lock:enchantment.bonus.armor.chainmail"}]
execute if items entity @s armor.legs *[custom_data~{"content_lock:armor":{}}] run data remove entity @s Inventory[{Slot:101b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical[{name:"content_lock:enchantment.bonus.armor.chainmail"}]
execute if items entity @s armor.chest *[custom_data~{"content_lock:armor":{}}] run data remove entity @s Inventory[{Slot:102b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical[{name:"content_lock:enchantment.bonus.armor.chainmail"}]
execute if items entity @s armor.head *[custom_data~{"content_lock:armor":{}}] run data remove entity @s Inventory[{Slot:103b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical[{name:"content_lock:enchantment.bonus.armor.chainmail"}]

## Remove the movement speed and attack damage reduction from the entity
attribute @s movement_speed modifier remove content_lock.enchantment.bonus.armor.chainmail
attribute @s attack_damage modifier remove content_lock.enchantment.bonus.armor.chainmail