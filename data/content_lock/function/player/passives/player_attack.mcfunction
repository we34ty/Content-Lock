advancement revoke @s only content_lock:checks/player_hurt_entity
execute if entity @s[tag=content_lock.touch_of_malice_active] run attribute @s attack_damage modifier remove content_lock.touch_of_malice
execute if entity @s[tag=content_lock.touch_of_malice_active] run tag @s remove content_lock.touch_of_malice_active