#$say $(physical_damage)
#$say $(fire_damage)
#$say $(frost_damage)
#$say $(magic_damage)
#$say $(wither_damage)
#$say $(ender_damage)
#$say $(damage_type)
#$say $(bleed_status)
#$say $(poison_status)
#$say $(corruption_status)
#$say $(wither_status)
#$say $(frostbite_status)

$damage @s $(physical_damage) content_lock:$(damage_type)/physical by @n from @n
$damage @s $(fire_damage) content_lock:$(damage_type)/fire by @n from @n
$damage @s $(frost_damage) content_lock:$(damage_type)/frost by @n from @n
$damage @s $(magic_damage) content_lock:$(damage_type)/magic by @n from @n
$damage @s $(wither_damage) content_lock:$(damage_type)/wither by @n from @n
$damage @s $(ender_damage) content_lock:$(damage_type)/ender by @n from @n

$function content_lock:player/weapons/entity/stacks_macro {name:"bleed_stacks", amount: $(bleed_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"poison_stacks", amount: $(poison_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"corruption_meter", amount: $(corruption_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"wither_stacks", amount: $(wither_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"frostbite_stacks", amount: $(frostbite_status)}

execute if data entity @s {Health:0.0f} run function content_lock:player/weapons/entity/killed_entity

$execute as @n run function content_lock:player/weapons/entity/damaged_entity_post_calculations {physical_damage: $(physical_damage), fire_damage: $(fire_damage), frost_damage: $(frost_damage), magic_damage: $(magic_damage), wither_damage: $(wither_damage), ender_damage: $(ender_damage), damage_type: "$(damage_type)", bleed_status: $(bleed_status), poison_status: $(poison_status), corruption_status: $(corruption_status), wither_status: $(wither_status), frostbite_status: $(frostbite_status)}
execute if score @n content_lock.enchantment.bonus.armor.gold.pieces matches 1.. if score @n content_lock.enchantment.bonus.armor.gold.timer matches 1.. run function content_lock:player/enchantments/bonuses/armor/gold/apply_debuff