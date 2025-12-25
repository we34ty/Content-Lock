scoreboard players set @s content_lock.temp1 100
scoreboard players operation @s content_lock.enchantment.lightstruck.distance /= @s content_lock.temp1
scoreboard players operation @s content_lock.enchantment.lightstruck += @s content_lock.enchantment.lightstruck.distance
execute if score @s content_lock.enchantment.lightstruck matches 30.. run scoreboard players set @s content_lock.enchantment.lightstruck 30