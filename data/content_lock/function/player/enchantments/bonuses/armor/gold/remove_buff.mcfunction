attribute @s movement_speed modifier remove content_lock.enchantment.bonus.armor.gold
attribute @s step_height modifier remove content_lock.enchantment.bonus.armor.gold
attribute @s safe_fall_distance modifier remove content_lock.enchantment.bonus.armor.gold
attribute @s attack_knockback modifier remove content_lock.enchantment.bonus.armor.gold

data merge storage content_lock:saved_stats {UUID:0, path:"weapon.damage_modifiers.fire",value:"content_lock.enchantment.bonus.armor.gold",record: "name"}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

function content_lock:player/passives/storage/player_data/remove_from_array_path_by_record with storage content_lock:saved_stats