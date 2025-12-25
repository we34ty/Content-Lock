execute if score @s content_lock.enchantment.lightstruck.distance matches 100.. run function content_lock:player/enchantments/lightstruck/add

execute if score @s content_lock.enchantment.lightstruck matches 5.. at @s run particle electric_spark ~ ~0.8 ~ 0.3 0.6 0.3 0.1 1 normal @a
execute if score @s content_lock.enchantment.lightstruck matches 9.. at @s run particle electric_spark ~ ~0.8 ~ 0.3 0.6 0.3 0.1 1 normal @a
execute if score @s content_lock.enchantment.lightstruck matches 16.. at @s run particle electric_spark ~ ~0.8 ~ 0.3 0.6 0.3 0.1 1 normal @a
execute if score @s content_lock.enchantment.lightstruck matches 25.. at @s run particle electric_spark ~ ~0.8 ~ 0.3 0.6 0.3 0.1 1 normal @a

execute if score L content_lock.timer1 matches 4 if predicate content_lock:random if score @s content_lock.enchantment.lightstruck matches 5.. at @s run playsound content_lock:item.enchantment.lightstruck player @a ~ ~ ~ 0.3 1

tag @s remove content_lock.enchantment.lightstruck