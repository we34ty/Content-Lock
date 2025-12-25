attribute @s attack_speed modifier remove content_lock.immovable
attribute @s entity_interaction_range modifier remove content_lock.immovable
attribute @s block_interaction_range modifier remove content_lock.immovable
$attribute @s attack_speed modifier add content_lock.immovable $(attack_speed) add_multiplied_total
$attribute @s entity_interaction_range modifier add content_lock.immovable $(attack_range) add_multiplied_total
$attribute @s block_interaction_range modifier add content_lock.immovable $(attack_range) add_multiplied_total
tag @s add content_lock.enchantment.immovable.stats