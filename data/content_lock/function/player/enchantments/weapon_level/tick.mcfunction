execute store result score @s content_lock.temp2 run data get entity @s SelectedItem.components."minecraft:custom_data"."content_lock:weapon".level
execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:enchantments"."content_lock:weapon_level"

execute if data entity @s SelectedItem.components."minecraft:custom_data"."content_lock:weapon".level if score @s content_lock.temp2 = @s content_lock.temp1 run return 0

particle enchanted_hit ~ ~1 ~ 0.3 1 0.3 0.1 40 normal @a
playsound block.enchantment_table.use neutral @a ~ ~ ~ 1 1

summon item ~ ~ ~ {Item:{id:"minecraft:dirt"},Tags:["content_lock.weapons.temporary_item"]}
data modify entity @n[tag=content_lock.weapons.temporary_item,type=item] Item set from entity @s SelectedItem
execute store result entity @n[tag=content_lock.weapons.temporary_item,type=item] Item.components."minecraft:custom_data"."content_lock:weapon".level int 1 run scoreboard players get @s content_lock.temp1

data modify storage content_lock:saved_stats modifiers set from entity @n[tag=content_lock.weapons.temporary_item,type=item] Item.components."minecraft:custom_data"."content_lock:weapon".damage_modifiers

data merge storage content_lock:saved_stats {type:0,value:0}
execute store result storage content_lock:saved_stats value float 0.1 run scoreboard players get @s content_lock.temp1
data merge storage content_lock:saved_stats {type:physical}
function content_lock:player/enchantments/weapon_level/write with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:fire}
function content_lock:player/enchantments/weapon_level/write with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:frost}
function content_lock:player/enchantments/weapon_level/write with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:magic}
function content_lock:player/enchantments/weapon_level/write with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:wither}
function content_lock:player/enchantments/weapon_level/write with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:ender}
function content_lock:player/enchantments/weapon_level/write with storage content_lock:saved_stats

data modify storage content_lock:saved_stats modifiers set from entity @n[tag=content_lock.weapons.temporary_item,type=item] Item.components."minecraft:custom_data"."content_lock:weapon".status_effect_modifiers
execute store result storage content_lock:saved_stats value float 0.07 run scoreboard players get @s content_lock.temp1
data merge storage content_lock:saved_stats {type:bleed}
function content_lock:player/enchantments/weapon_level/write_status with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:poison}
function content_lock:player/enchantments/weapon_level/write_status with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:corruption}
function content_lock:player/enchantments/weapon_level/write_status with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:wither}
function content_lock:player/enchantments/weapon_level/write_status with storage content_lock:saved_stats
data merge storage content_lock:saved_stats {type:frostbite}
function content_lock:player/enchantments/weapon_level/write_status with storage content_lock:saved_stats

item replace entity @s weapon.mainhand from entity @n[type=item,tag=content_lock.weapons.temporary_item] contents
kill @n[type=item,tag=content_lock.weapons.temporary_item]