scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.fire_timer 1

execute unless score @s content_lock.enchantment.bonus.armor.iron.fire_timer matches 0 run return 0
scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.stacks 1

data merge storage content_lock:saved_stats {UUID:0,path:"weapon.damage_modifiers.fire",record:name,value:"content_lock.enchantment.bonus.armor.iron.fire_buff_mult"}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/passives/storage/player_data/remove_from_array_path_by_record with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {value:"content_lock.enchantment.bonus.armor.iron.fire_buff_add"}
function content_lock:player/passives/storage/player_data/remove_from_array_path_by_record with storage content_lock:saved_stats