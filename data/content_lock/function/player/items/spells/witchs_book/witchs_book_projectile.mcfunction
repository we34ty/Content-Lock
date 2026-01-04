scoreboard players add @s content_lock.timer1 1
#$execute rotated as @p[nbt={UUID:$(UUID)}] run tp @s ^ ^ ^1

$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @s[nbt={Owner:$(UUID)}] run damage @s $(damage) player_explosion by @p[nbt={UUID:$(UUID)}]
particle electric_spark ~ ~ ~ 0 0 0 1 15 force @a
particle enchant ~ ~ ~ 0 0 0 1 10 force @a
particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a
playsound item.trident.thunder hostile @a ~ ~ ~ 0.1 0.5

$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) if entity @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt={Owner:$(UUID)}] run kill @s
$execute positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) if entity @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] unless entity @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt={Owner:$(UUID)}] run return 0

execute unless block ~ ~ ~ #walkable run kill @s
execute unless block ~ ~ ~ #walkable run return 0

execute if score @s content_lock.timer1 matches 20.. run kill @s
execute if score @s content_lock.timer1 matches 20.. run return 0

$execute facing entity @p[nbt={UUID:$(UUID)}] feet rotated ~180 ~ rotated as @p[nbt={UUID:$(UUID)}] positioned ^ ^ ^1 run function content_lock:player/items/spells/witchs_book/witchs_book_projectile {half_range:$(half_range),range:$(range),UUID:$(UUID),damage:$(damage)}