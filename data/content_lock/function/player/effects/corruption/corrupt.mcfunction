scoreboard players set @s content_lock.corruption_meter 12000

execute if entity @s[tag=content_lock.corrupted] run return 0
tellraw @s [{"translate": "content_lock:effect.corruption.activated","color":"red"}]
tag @s add content_lock.corrupted

function content_lock:player/weapons/modifier/weapon/apply {name: "content_lock.corruption.melee", operation: "multiply", damage_type: "melee", physical_damage: -0.35, fire_damage: -0.35, frost_damage: -0.35, magic_damage: -0.35, wither_damage: -0.35, ender_damage: -0.35, bleed_status: 0, poison_status: 0, corruption_status: 0, wither_status: 0, frostbite_status: 0}
function content_lock:player/weapons/modifier/weapon/apply {name: "content_lock.corruption.ranged", operation: "multiply", damage_type: "ranged", physical_damage: -0.2, fire_damage: -0.2, frost_damage: -0.2, magic_damage: -0.2, wither_damage: -0.2, ender_damage: -0.2, bleed_status: 0, poison_status: 0, corruption_status: 0, wither_status: 0, frostbite_status: 0}
function content_lock:player/weapons/modifier/weapon/apply {name: "content_lock.corruption.magic", operation: "multiply", damage_type: "magic", physical_damage: -0.5, fire_damage: -0.5, frost_damage: -0.5, magic_damage: -0.5, wither_damage: -0.5, ender_damage: -0.5, bleed_status: 0, poison_status: 0, corruption_status: 0, wither_status: 0, frostbite_status: 0}