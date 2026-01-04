playsound content_lock:item.spell.undead_book player @a ~ ~ ~ 1 1
function content_lock:player/items/spells/spell_cast_macro {durability:200}
$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @s[nbt={Owner:$(UUID)}] run damage @s $(damage) fly_into_wall by @p[nbt={UUID:$(UUID)}]
$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @s[nbt={Owner:$(UUID)}] run effect give @s slowness 3 2 false
