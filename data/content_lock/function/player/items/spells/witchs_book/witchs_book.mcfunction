scoreboard players add @s content_lock.witchs_book_charge 1
scoreboard players set @s content_lock.reset_spell 2

$execute if score @s content_lock.witchs_book_charge matches 1..$(attack_speed) positioned ~ ~1 ~ positioned ^ ^ ^1 run particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.02 4 normal @a
execute if score @s content_lock.witchs_book_charge matches 1 run playsound content_lock:item.spell.charging player @a ~ ~ ~ 1 1.2
$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) run function content_lock:player/items/spells/witchs_book/witchs_book_ready {half_range:$(half_range),range:$(range),UUID:$(UUID),damage:$(damage),attack_speed:$(attack_speed)}
#$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] run damage @s $(damage) fly_into_wall by @p[nbt={UUID:$(UUID)}]
scoreboard players operation @s content_lock.temp2 = @s content_lock.witchs_book_charge
scoreboard players remove @s content_lock.temp2 14
$execute if score @s content_lock.temp2 matches $(attack_speed).. run scoreboard players set @s content_lock.witchs_book_charge 0