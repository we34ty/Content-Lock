attribute @s max_health modifier add content_lock.corruption -0.5 add_multiplied_base
attribute @s entity_interaction_range modifier add content_lock.corruption 0.5 add_value
attribute @s block_interaction_range modifier add content_lock.corruption 1 add_value

execute if entity @s[tag=content_lock.corrupted_meter_full] run return 0
tellraw @s {"translate": "content_lock:effect.corruption.activated","color":"red"}
tag @s add content_lock.corrupted_meter_full