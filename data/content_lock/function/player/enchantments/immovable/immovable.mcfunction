execute if score @s content_lock.enchantment.immovable matches ..200 run scoreboard players add @s content_lock.enchantment.immovable 1

data merge storage content_lock:saved_stats {attack_speed:0.0f,attack_range:0.0f}
execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:enchantments"."content_lock:immovable"
scoreboard players operation @s content_lock.temp1 *= @s content_lock.enchantment.immovable
execute store result storage content_lock:saved_stats attack_speed float 0.001 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats attack_range float 0.0015 run scoreboard players get @s content_lock.temp1
function content_lock:player/enchantments/immovable/stat_macro with storage content_lock:saved_stats

execute if predicate content_lock:detect_movement run function content_lock:player/enchantments/immovable/remove_stats

tag @s remove content_lock.enchantment.immovable