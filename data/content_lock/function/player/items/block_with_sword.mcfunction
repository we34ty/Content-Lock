tag @s add content_lock.blocking_with_sword
tag @s remove content_lock.blocking_with_sword_disable
attribute @s explosion_knockback_resistance modifier add content_lock.blocking_with_sword 0.4 add_value
attribute @s knockback_resistance modifier add content_lock.blocking_with_sword 0.4 add_value
attribute @s fall_damage_multiplier modifier add content_lock.blocking_with_sword -0.3 add_value
attribute @s armor modifier add content_lock.blocking_with_sword 6 add_value

execute if entity @s[nbt={HurtTime:9s}] run function content_lock:player/items/block_with_sword_blocked