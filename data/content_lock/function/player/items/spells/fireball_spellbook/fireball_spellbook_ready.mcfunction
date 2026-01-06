playsound item.firecharge.use player @a ~ ~ ~ 1 0.8

function content_lock:player/items/spells/spell_cast_macro {durability:550}

execute positioned ~ ~1 ~ run summon marker ^ ^ ^1 {Tags:["content_lock.fireball_spellbook_projectile"]}
$execute as @n[tag=content_lock.fireball_spellbook_projectile] at @s run function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook_projectile {half_range:$(half_range),range:$(range),half_explosion_range:$(half_explosion_range),explosion_range:$(explosion_range),fire_duration:$(fire_duration),UUID:$(UUID),damage:$(damage)}
