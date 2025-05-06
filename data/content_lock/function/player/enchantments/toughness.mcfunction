execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:enchantments".levels."content_lock:toughness"

execute if score @s content_lock.temp1 matches 1 run effect give @s resistance 1 1 false
execute if score @s content_lock.temp1 matches 2.. run effect give @s resistance 1 2 false
playsound item.armor.equip_generic player @a ~ ~ ~ 0.2 0.6