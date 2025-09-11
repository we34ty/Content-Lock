scoreboard players add @s content_lock.witchs_book_charge 1
scoreboard players set @s content_lock.reset_spell 2

$execute if score @s content_lock.witchs_book_charge matches 1..$(attack_speed) positioned ~ ~1 ~ positioned ^ ^ ^1 run particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.02 4 normal @a
execute if score @s content_lock.witchs_book_charge matches 1 run playsound entity.evoker.prepare_summon player @a ~ ~ ~ 1 1.5
$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) run playsound entity.lightning_bolt.thunder player @a ~ ~ ~ 1 1.4
$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) run clear @s *[custom_data~{"content_lock.magical_dust":true}] 1
$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) positioned ~ ~1 ~ run summon area_effect_cloud ^ ^ ^1 {Tags:["content_lock.witchs_book_projectile"],Radius:0.0f}
$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) as @e[tag=content_lock.witchs_book_projectile,limit=1,sort=nearest] at @s run function content_lock:player/items/spells/witchs_book_projectile {half_range:$(half_range),range:$(range),UUID:$(UUID),damage:$(damage)}
#$execute if score @s content_lock.witchs_book_charge matches $(attack_speed) positioned ~-$(half_range) ~-$(half_range) ~-$(half_range) as @e[type=!#entities,dx=$(range),dy=$(range),dz=$(range),nbt=!{UUID:$(UUID)}] run damage @s $(damage) fly_into_wall by @p[nbt={UUID:$(UUID)}]
scoreboard players set @s content_lock.temp1 14
scoreboard players operation @s content_lock.temp2 = @s content_lock.witchs_book_charge
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1
$execute if score @s content_lock.temp2 matches $(attack_speed) run scoreboard players set @s content_lock.witchs_book_charge 0