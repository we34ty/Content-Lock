data merge storage content_lock:saved_stats {value:0}
execute store result storage content_lock:saved_stats value int 1000 run scoreboard players get @s content_lock.enchantment.bonus.weapon.wood.last_damage
function content_lock:player/passives/heal_macro_easy with storage content_lock:saved_stats

tag @s remove content_lock.enchantment.bonus.weapon.wood.heal