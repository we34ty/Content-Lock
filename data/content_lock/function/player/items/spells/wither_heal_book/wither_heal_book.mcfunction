scoreboard players add @s content_lock.wither_heal_book_charge 1
scoreboard players set @s content_lock.reset_spell 2

$execute if score @s content_lock.wither_heal_book_charge matches 1..$(attack_speed) run particle dust{color:5395026,scale:2} ~ ~1 ~ 0.5 1 0.5 1 5 force @a
$execute if score @s content_lock.wither_heal_book_charge matches 1..$(attack_speed) run particle dust{color:2566283,scale:2} ~ ~1 ~ 0.5 1 0.5 1 5 force @a
$execute if score @s content_lock.wither_heal_book_charge matches 1..$(attack_speed) run particle enchant ~ ~1 ~ 0.5 1 0.5 1 5 normal @a
execute if score @s content_lock.wither_heal_book_charge matches 1 run playsound content_lock:item.spell.charging player @a ~ ~ ~ 1 0.1
$execute if score @s content_lock.wither_heal_book_charge matches $(attack_speed) run function content_lock:player/items/spells/wither_heal_book/wither_heal_book_explode {half_range:$(half_range),range:$(range),UUID:$(UUID),damage:$(damage),healing:$(healing),attack_speed:$(attack_speed)}
#$execute if score @s content_lock.wither_heal_book_charge matches $(attack_speed) positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] run damage @s $(damage) fly_into_wall by @p[nbt={UUID:$(UUID)}]
scoreboard players operation @s content_lock.temp2 = @s content_lock.wither_heal_book_charge
scoreboard players remove @s content_lock.temp2 14
$execute if score @s content_lock.temp2 matches $(attack_speed).. run scoreboard players set @s content_lock.wither_heal_book_charge 0