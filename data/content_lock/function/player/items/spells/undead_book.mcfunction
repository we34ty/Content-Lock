scoreboard players add @s content_lock.undead_book_charge 1
scoreboard players set @s content_lock.reset_spell 2

$execute if score @s content_lock.undead_book_charge matches 1..$(attack_speed) positioned ~ ~1 ~ positioned ^ ^ ^1 run particle sculk_soul ~ ~ ~ 0.1 0.1 0.1 0.02 4 normal @a
execute if score @s content_lock.undead_book_charge matches 1 run playsound entity.evoker.prepare_summon player @a ~ ~ ~ 1 1
$execute if score @s content_lock.undead_book_charge matches 1..$(attack_speed) at @e[type=!#entities,type=!villager,distance=0.1..$(range)] run particle block_crumble{block_state:dirt} ~ ~ ~ 0.5 0.5 0.5 1 10 normal
$execute if score @s content_lock.undead_book_charge matches 1..$(attack_speed) as @e[type=!#entities,type=!villager,type=!player,distance=0.1..$(range)] run effect give @s slowness 1 0 false
$execute if score @s content_lock.undead_book_charge matches $(attack_speed) run playsound entity.evoker.cast_spell player @a ~ ~ ~ 1 1.4
$execute if score @s content_lock.undead_book_charge matches $(attack_speed) run clear @s *[custom_data={"magical_dust":true}] 1
$execute if score @s content_lock.undead_book_charge matches $(attack_speed) as @e[type=!#entities,type=!villager,distance=0.1..$(range)] run damage @s $(damage) fly_into_wall by @p[nbt={UUID:$(UUID)}]
scoreboard players set @s content_lock.temp1 14
scoreboard players operation @s content_lock.temp2 = @s content_lock.undead_book_charge
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1
$execute if score @s content_lock.temp2 matches $(attack_speed) run scoreboard players set @s content_lock.undead_book_charge 0