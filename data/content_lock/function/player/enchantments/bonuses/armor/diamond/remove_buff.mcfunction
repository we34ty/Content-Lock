execute unless entity @s[tag=content_lock.enchantment.bonus.armor.diamond.exclude_removal] run scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.stacks 0

data merge storage content_lock:saved_stats {UUID:0, path:"weapon.status_effect_modifiers.bleed",record:name,value:"content_lock.enchantment.bonus.armor.diamond.buff"}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

function content_lock:player/passives/storage/player_data/remove_from_array_path_by_record with storage content_lock:saved_stats