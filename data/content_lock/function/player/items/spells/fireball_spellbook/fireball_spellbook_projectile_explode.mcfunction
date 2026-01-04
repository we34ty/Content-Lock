$execute positioned ~-$(half_explosion_range) ~-$(half_explosion_range) ~-$(half_explosion_range) as @e[type=!#entities,dx=$(explosion_range),dy=$(explosion_range),dz=$(explosion_range),nbt=!{UUID:$(UUID)}] unless entity @s[nbt={Owner:$(UUID)}] run damage @s $(damage) fireball by @p[nbt={UUID:$(UUID)}]
$execute positioned ~-$(half_explosion_range) ~-$(half_explosion_range) ~-$(half_explosion_range) as @e[type=!#entities,type=!player,dx=$(explosion_range),dy=$(explosion_range),dz=$(explosion_range),nbt=!{UUID:$(UUID)}] unless entity @s[nbt={Owner:$(UUID)}] run data modify entity @s Fire set value $(fire_duration)

$particle flame ~ ~ ~ $(range) $(range) $(range) 1 30 force @a
$particle explosion ~ ~ ~ $(explosion_range) $(explosion_range) $(explosion_range) 1 30 force @a
playsound entity.generic.explode hostile @a ~ ~ ~ 0.5 1.7

kill @s