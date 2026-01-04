scoreboard players add @s content_lock.fireball_spellbook_charge 1
scoreboard players set @s content_lock.reset_spell 2

$execute if score @s content_lock.fireball_spellbook_charge matches 1..$(attack_speed) positioned ~ ~1 ~ positioned ^ ^ ^1 run particle flame ~ ~ ~ 0.1 0.1 0.1 0.02 4 normal @a
execute if score @s content_lock.fireball_spellbook_charge matches 1 run playsound content_lock:item.spell.charging player @a ~ ~ ~ 1 1.2
$execute if score @s content_lock.fireball_spellbook_charge matches $(attack_speed) run function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook_ready {half_range:$(half_range),range:$(range),half_explosion_range:$(half_explosion_range),explosion_range:$(explosion_range),UUID:$(UUID),damage:$(damage),fire_duration:$(fire_duration),attack_speed:$(attack_speed)}
scoreboard players operation @s content_lock.temp2 = @s content_lock.fireball_spellbook_charge
scoreboard players remove @s content_lock.temp2 14
$execute if score @s content_lock.temp2 matches $(attack_speed).. run scoreboard players set @s content_lock.fireball_spellbook_charge 0