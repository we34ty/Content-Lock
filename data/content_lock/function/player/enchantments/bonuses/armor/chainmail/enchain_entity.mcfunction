## Set the timer for the enchain effect to 100 ticks (5 seconds)
scoreboard players set @s content_lock.enchantment.bonus.armor.chainmail.timer 100

particle angry_villager ~ ~2 ~ 0.2 0.2 0.2 1 10 normal

## Apply the physical resistance reduction to the entity's armor
$execute if items entity @s armor.feet *[custom_data~{"content_lock:armor":{}}] run data modify entity @s Inventory[{Slot:100b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical append value {type:"add",value:-$(reduction),name:"content_lock:enchantment.bonus.armor.chainmail"}
$execute if items entity @s armor.legs *[custom_data~{"content_lock:armor":{}}] run data modify entity @s Inventory[{Slot:101b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical append value {type:"add",value:-$(reduction),name:"content_lock:enchantment.bonus.armor.chainmail"}
$execute if items entity @s armor.chest *[custom_data~{"content_lock:armor":{}}] run data modify entity @s Inventory[{Slot:102b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical append value {type:"add",value:-$(reduction),name:"content_lock:enchantment.bonus.armor.chainmail"}
$execute if items entity @s armor.head *[custom_data~{"content_lock:armor":{}}] run data modify entity @s Inventory[{Slot:103b}].components."custom_data"."content_lock:armor".resistance_modifiers.physical append value {type:"add",value:-$(reduction),name:"content_lock:enchantment.bonus.armor.chainmail"}

## Apply the movement speed and attack damage reduction to the entity
execute unless entity @s[tag=content_lock.boss] run attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.chainmail -1 add_multiplied_total
execute unless entity @s[tag=content_lock.boss] run return run attribute @s attack_damage modifier add content_lock.enchantment.bonus.armor.chainmail -1 add_multiplied_total

## Bosses gain reduced effects from the enchain effect, so we apply a smaller reduction to their movement speed and attack damage
attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.chainmail -0.6 add_multiplied_total
attribute @s attack_damage modifier add content_lock.enchantment.bonus.armor.chainmail -0.33 add_multiplied_total