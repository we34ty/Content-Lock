data merge storage content_lock:saved_stats {name:"content_lock.enchantment.bonus.armor.iron.enemy_damage"}

function content_lock:player/weapons/entity/remove_armor_modifier with storage content_lock:saved_stats

attribute @s attack_knockback modifier remove content_lock.enchantment.bonus.armor.iron.enemy_damage
