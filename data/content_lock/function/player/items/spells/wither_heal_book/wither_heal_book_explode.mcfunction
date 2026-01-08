playsound entity.wither.spawn hostile @a ~ ~ ~ 2 2

function content_lock:player/items/spells/spell_cast_macro {durability:800}

$scoreboard players add @s content_lock.wither_regen $(healing)
scoreboard players set @s content_lock.wither_regen.timer 600

$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] run damage @s $(damage) player_explosion by @p[nbt={UUID:$(UUID)}]
$particle explosion ~ ~1 ~ $(range) $(range) $(range) 1 100 force @a
particle soul_fire_flame ~ ~1 ~ 0 0 0 1 100 normal @a