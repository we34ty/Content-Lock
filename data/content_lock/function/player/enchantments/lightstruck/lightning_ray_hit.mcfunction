particle electric_spark ~ ~ ~ 0.5 0.5 0.5 1 30 force @a

scoreboard players set @s content_lock.temp1 3
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp3
data merge storage content_lock:saved_stats {damage:0f}
execute store result storage content_lock:saved_stats damage float 1 run scoreboard players get @s content_lock.temp1
function content_lock:player/enchantments/lightstruck/lightning_damage_macro with storage content_lock:saved_stats
scoreboard players set @s content_lock.temp1 0

tag @n[tag=content_lock.enchantment.lightstruck.to_be_damaged] add content_lock.enchantment.lightstruck.damaged
tag @n[tag=content_lock.enchantment.lightstruck.to_be_damaged] remove content_lock.enchantment.lightstruck.to_be_damaged
