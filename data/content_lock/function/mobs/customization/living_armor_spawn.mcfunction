attribute @s spawn_reinforcements modifier add content_lock.customized_content_lock2 -1 add_multiplied_total
attribute @s armor modifier add content_lock.customized_content_lock2 0.3 add_multiplied_total
attribute @s armor_toughness modifier add content_lock.customized_content_lock2 0.3 add_multiplied_total
attribute @s armor_toughness modifier add content_lock.customized_content_lock3 8 add_value
attribute @s attack_knockback modifier add content_lock.customized_content_lock2 3 add_value
attribute @s knockback_resistance modifier add content_lock.customized_content_lock2 0.2 add_value
attribute @s movement_speed modifier add content_lock.customized_content_lock2 -0.25 add_multiplied_base
#attribute @s attack_damage modifier add content_lock.customized_content_lock2 0.35 add_multiplied_base

data merge entity @s {Silent:1b,DrownedConversionTime:100000000}
effect give @s invisibility infinite 0 true

item replace entity @s armor.head with iron_helmet
item replace entity @s armor.chest with iron_chestplate
item replace entity @s armor.legs with iron_leggings
item replace entity @s armor.feet with iron_boots

tag @s remove content_lock.can_be_raised_from_ground
tag @s remove content_lock.can_charge_jump
tag @s remove content_lock.attacks_on_sight

tag @s add content_lock.deals_stamina_damage
tag @s add content_lock.living_armor_sounds
