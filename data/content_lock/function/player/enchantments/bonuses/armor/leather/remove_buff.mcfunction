data merge storage content_lock:saved_stats {UUID:0, path:"weapon.status_effect_modifiers.bleed",value:"content_lock.enchantment.bonus.armor.leather",record: "name"}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

function content_lock:player/passives/storage/player_data/remove_from_array_path_by_record with storage content_lock:saved_stats