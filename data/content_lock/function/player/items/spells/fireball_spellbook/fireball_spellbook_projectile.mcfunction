scoreboard players add @s content_lock.timer1 1
#$execute rotated as @p[nbt={UUID:$(UUID)}] run tp @s ^ ^ ^1

$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @s[nbt={Owner:$(UUID)}] run damage @s $(damage) fireball by @p[nbt={UUID:$(UUID)}]
particle flame ~ ~ ~ 0.1 0.1 0.1 0.1 10 force @a
particle small_flame ~ ~ ~ 0 0 0 1 10 force @a
playsound block.fire.extinguish hostile @a ~ ~ ~ 0.1 2

$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) if entity @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt={Owner:$(UUID)}] run return run function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook_projectile_explode {range:$(range),half_range:$(half_range),half_explosion_range:$(half_explosion_range),explosion_range:$(explosion_range),fire_duration:$(fire_duration),UUID:$(UUID),damage:$(damage)}

$execute unless block ~ ~ ~ #walkable run function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook_projectile_explode {range:$(range),half_range:$(half_range),half_explosion_range:$(half_explosion_range),explosion_range:$(explosion_range),fire_duration:$(fire_duration),UUID:$(UUID),damage:$(damage)}

execute if score @s content_lock.timer1 matches 20.. run return run kill @s

$execute facing entity @p[nbt={UUID:$(UUID)}] feet rotated ~180 ~ rotated as @p[nbt={UUID:$(UUID)}] positioned ^ ^ ^1 run function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook_projectile {half_range:$(half_range),range:$(range),half_explosion_range:$(half_explosion_range),explosion_range:$(explosion_range),fire_duration:$(fire_duration),UUID:$(UUID),damage:$(damage)}