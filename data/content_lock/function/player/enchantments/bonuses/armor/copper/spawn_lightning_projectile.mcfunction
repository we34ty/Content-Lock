$execute if entity @s[nbt={UUID:$(UUID)}] run return 0

summon marker ~ ~1 ~ {Tags:["content_lock.enchantment.bonus.armor.copper.lightning_projectile"]}
$execute positioned ~ ~1 ~ as @n[type=marker,tag=content_lock.enchantment.bonus.armor.copper.lightning_projectile] at @s run function content_lock:player/weapons/entity/create_projectile {Owner:$(UUID),damage_type:$(damage_type),physical_damage:$(physical_damage),fire_damage:$(fire_damage),frost_damage:$(frost_damage),magic_damage:$(magic_damage),wither_damage:$(wither_damage),ender_damage:$(ender_damage),bleed_status:$(bleed_status),poison_status:$(poison_status),corruption_status:$(corruption_status),wither_status:$(wither_status),frostbite_status:$(frostbite_status)}

function content_lock:player/weapons/entity/calculate_resistances with storage content_lock:saved_stats

playsound entity.lightning_bolt.impact player @a ~ ~ ~ 0.2 1.4
particle electric_spark ~ ~1 ~ 0.3 0.3 0.3 0.1 10 normal @a
