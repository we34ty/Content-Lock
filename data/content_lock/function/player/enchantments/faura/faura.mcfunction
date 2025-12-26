execute if score @s content_lock.enchantment.faura matches ..200 run scoreboard players add @s content_lock.enchantment.faura 1

data merge storage content_lock:saved_stats {knockback_resistance:0.0f,regen:0}
scoreboard players operation @s content_lock.enchantment.faura.pieces *= @s content_lock.enchantment.faura
execute store result storage content_lock:saved_stats knockback_resistance float 0.0005 run scoreboard players get @s content_lock.enchantment.faura.pieces
execute store result storage content_lock:saved_stats regen int 0.042 run scoreboard players get @s content_lock.enchantment.faura.pieces
function content_lock:player/enchantments/faura/stat_macro with storage content_lock:saved_stats

execute if predicate content_lock:detect_movement run function content_lock:player/enchantments/faura/remove_stats

tag @s remove content_lock.enchantment.faura