$attribute @s max_health modifier add content_lock.heal_macro $(value) add_value
effect give @s instant_health 1 40 true
tag @s add content_lock.remove_health_deprived
