attribute @s spawn_reinforcements modifier add content_lock.customized_content_lock2 -1 add_multiplied_total
attribute @s armor modifier add content_lock.customized_content_lock2 0.3 add_multiplied_total
attribute @s armor_toughness modifier add content_lock.customized_content_lock2 0.3 add_multiplied_total
attribute @s armor_toughness modifier add content_lock.customized_content_lock3 8 add_value
attribute @s attack_knockback modifier add content_lock.customized_content_lock2 3 add_value
attribute @s knockback_resistance modifier add content_lock.customized_content_lock2 0.2 add_value
attribute @s movement_speed modifier add content_lock.customized_content_lock2 -0.25 add_multiplied_base
attribute @s max_health modifier remove content_lock.customized_content_lock
attribute @s max_health modifier add content_lock.customized_content_lock -0.15 add_multiplied_base
attribute @s safe_fall_distance modifier add content_lock.customized_content_lock 100 add_value

data merge entity @s {Silent:1b,DrownedConversionTime:100000000,DeathLootTable:"content_lock:entities/living_armor",CustomName:{"translate": "content_lock:mob.living_armor"},CustomNameVisible:0b}
effect give @s invisibility infinite 0 true

item replace entity @s armor.head with iron_helmet[attribute_modifiers=[{"type": "minecraft:armor","id": "content_lock.basic_armor_stats_head","amount": 1,"operation": "add_value","slot": "head"},{"type": "minecraft:armor_toughness","id": "content_lock.basic_armor_stats_head","amount": 2.5,"operation": "add_value","slot": "head"},{"type": "minecraft:movement_efficiency","id": "content_lock.basic_armor_stats_head","amount": -0.18,"operation": "add_multiplied_base","slot": "head"}]]
item replace entity @s armor.chest with iron_chestplate[attribute_modifiers=[{"type": "minecraft:armor","id": "content_lock.basic_armor_stats_chest","amount": 2.67,"operation": "add_value","slot": "chest"},{"type": "minecraft:armor_toughness","id": "content_lock.basic_armor_stats_chest","amount": 6.67,"operation": "add_value","slot": "chest"},{"type": "minecraft:movement_efficiency","id": "content_lock.basic_armor_stats_chest","amount": -0.24,"operation": "add_multiplied_base","slot": "chest"}]]
item replace entity @s armor.legs with iron_leggings[attribute_modifiers=[{"type": "minecraft:armor","id": "content_lock.basic_armor_stats_legs","amount": 1.34,"operation": "add_value","slot": "legs"},{"type": "minecraft:armor_toughness","id": "content_lock.basic_armor_stats_legs","amount": 3.34,"operation": "add_value","slot": "legs"},{"type": "minecraft:movement_efficiency","id": "content_lock.basic_armor_stats_legs","amount": -0.21,"operation": "add_multiplied_base","slot": "legs"}]]
item replace entity @s armor.feet with iron_boots[attribute_modifiers=[{"type": "minecraft:armor","id": "content_lock.basic_armor_stats_boots","amount": 1,"operation": "add_value","slot": "feet"},{"type": "minecraft:armor_toughness","id": "content_lock.basic_armor_stats_boots","amount": 2.5,"operation": "add_value","slot": "feet"},{"type": "minecraft:movement_efficiency","id": "content_lock.basic_armor_stats_boots","amount": -0.18,"operation": "add_multiplied_base","slot": "feet"}]]

tag @s remove content_lock.can_be_raised_from_ground
tag @s remove content_lock.can_charge_jump
tag @s remove content_lock.attacks_on_sight

tag @s add content_lock.deals_stamina_damage
tag @s add content_lock.living_armor_sounds
