$damage @s $(physical_damage) content_lock:$(damage_type)/physical by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(fire_damage) content_lock:$(damage_type)/fire by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(frost_damage) content_lock:$(damage_type)/frost by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(magic_damage) content_lock:$(damage_type)/magic by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(wither_damage) content_lock:$(damage_type)/wither by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(ender_damage) content_lock:$(damage_type)/ender by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]

$function content_lock:player/weapons/entity/stacks_macro {name:"bleed_stacks", amount: $(bleed_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"poison_stacks", amount: $(poison_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"corruption_meter", amount: $(corruption_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"wither_stacks", amount: $(wither_status)}
$function content_lock:player/weapons/entity/stacks_macro {name:"frostbite_stacks", amount: $(frostbite_status)}

#$say $(physical_damage)
#$say $(fire_damage)
#$say $(frost_damage)
#$say $(magic_damage)
#$say $(wither_damage)
#$say $(ender_damage)
#$say $(damage_type)
