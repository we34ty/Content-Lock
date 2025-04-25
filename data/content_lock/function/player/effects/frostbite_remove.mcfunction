attribute @s max_health modifier remove content_lock.frostbite
attribute @s attack_speed modifier remove content_lock.frostbite
attribute @s movement_speed modifier remove content_lock.frostbite
attribute @s attack_damage modifier remove content_lock.frostbite

tellraw @s {"translate": "content_lock:effect.frostbite.deactivated","color":"gold"}
tag @s remove content_lock.frostbite_active