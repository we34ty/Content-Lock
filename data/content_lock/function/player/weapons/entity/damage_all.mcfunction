$damage @s $(physical_damage) content_lock:$(damage_type)/physical by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(fire_damage) content_lock:$(damage_type)/fire by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(frost_damage) content_lock:$(damage_type)/frost by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(magic_damage) content_lock:$(damage_type)/magic by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(wither_damage) content_lock:$(damage_type)/wither by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]
$damage @s $(ender_damage) content_lock:$(damage_type)/ender by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]

$scoreboard players add @s content_lock.bleed_stacks $(bleed_status)
$scoreboard players add @s content_lock.poison_stacks $(poison_status)
$scoreboard players add @s content_lock.corruption_meter $(corruption_status)
$scoreboard players add @s content_lock.wither_stacks $(wither_status)
$scoreboard players add @s content_lock.frostbite_stacks $(frostbite_status)

$tag @s add content_lock.weapons.hit_id.$(Id)