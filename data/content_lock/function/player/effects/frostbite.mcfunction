execute if entity @s[tag=content_lock.frostbite_active] run return 0

attribute @s movement_speed modifier add content_lock.frostbite -0.25 add_multiplied_total

function content_lock:player/weapons/entity/apply_armor_modifier {name: "content_lock.frostbite", operation: "add", physical_damage:-15, fire_damage:-15, frost_damage:-15, magic_damage:-15, wither_damage:-15, ender_damage:-15, bleed_status:-15, poison_status:-15, corruption_status:-15, wither_status:-15, frostbite_status:100}

data merge storage content_lock:saved_stats {damage:1.0f}
execute unless entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 150
execute if entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 50
execute at @s run function content_lock:player/effects/frostbite_damage with storage content_lock:saved_stats

scoreboard players set @s content_lock.frostbite_stacks 120
tellraw @s [{"translate": "content_lock:effect.frostbite.activated","color":"gold"}]
tag @s add content_lock.frostbite_active
