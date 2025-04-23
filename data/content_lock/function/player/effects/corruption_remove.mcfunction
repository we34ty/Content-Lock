attribute @s max_health modifier remove content_lock.corruption
attribute @s entity_interaction_range modifier remove content_lock.corruption
attribute @s block_interaction_range modifier remove content_lock.corruption

tellraw @s {"translate": "content_lock:effect.corruption.deactivated","color":"blue"}
tag @s remove content_lock.corrupted_meter_full