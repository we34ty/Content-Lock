execute unless score @s content_lock.enchantment.lightstruck matches 5.. run return 0

summon marker ~ ~1 ~ {Tags:[content_lock.enchantment.lightstruck.lightning]}

scoreboard players operation @n[tag=content_lock.enchantment.lightstruck.lightning] content_lock.enchantment.lightstruck = @s content_lock.enchantment.lightstruck
execute store result score @n[tag=content_lock.enchantment.lightstruck.lightning] content_lock.temp3 run data get entity @s SelectedItem.components."minecraft:enchantments"."content_lock:lightstruck"

scoreboard players set @s content_lock.enchantment.lightstruck 0