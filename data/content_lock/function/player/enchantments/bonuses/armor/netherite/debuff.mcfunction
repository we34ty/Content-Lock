effect give @s slowness 1 1 false

$function content_lock:player/weapons/modifier/armor/apply {name:"content_lock.enchantment.bonus.armor.netherite.debuff", operation:"multiply", physical_damage:0, fire_damage:0, frost_damage:0, magic_damage:0, wither_damage:$(wither_reduction), ender_damage:0, bleed_status:0, poison_status:0, corruption_status:0, wither_status:$(wither_reduction), frostbite_status:0}
tag @s add content_lock.enchantment.bonus.armor.netherite.debuff