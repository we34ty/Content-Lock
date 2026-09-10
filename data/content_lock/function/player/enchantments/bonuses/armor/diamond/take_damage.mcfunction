execute if entity @s[tag=content_lock.enchantment.bonus.armor.diamond.exclude] run return 0
tag @s add content_lock.enchantment.bonus.armor.diamond.exclude

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:100}
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 1 if score @s content_lock.enchantment.bonus.armor.diamond.jumps matches ..0 if score @s content_lock.temp1 matches ..50 run scoreboard players add @s content_lock.enchantment.bonus.armor.diamond.jumps 1
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 2 if score @s content_lock.enchantment.bonus.armor.diamond.jumps matches ..0 if score @s content_lock.temp1 matches ..66 run scoreboard players add @s content_lock.enchantment.bonus.armor.diamond.jumps 1
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 3 if score @s content_lock.enchantment.bonus.armor.diamond.jumps matches ..1 if score @s content_lock.temp1 matches ..80 run scoreboard players add @s content_lock.enchantment.bonus.armor.diamond.jumps 1
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 4 if score @s content_lock.enchantment.bonus.armor.diamond.jumps matches ..2 run scoreboard players add @s content_lock.enchantment.bonus.armor.diamond.jumps 1

execute unless score @s content_lock.enchantment.bonus.armor.diamond.stacks matches 5.. run scoreboard players add @s content_lock.enchantment.bonus.armor.diamond.stacks 1

tag @s add content_lock.enchantment.bonus.armor.diamond.exclude_removal
function content_lock:player/enchantments/bonuses/armor/diamond/remove_buff
tag @s remove content_lock.enchantment.bonus.armor.diamond.exclude_removal

data merge storage content_lock:saved_stats {UUID:0, path:"weapon.status_effect_modifiers.bleed",data:{name:"content_lock.enchantment.bonus.armor.diamond.buff", value:0, operation:"add"}}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

scoreboard players set @s content_lock.temp1 0
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 1 run scoreboard players set @s content_lock.temp1 5
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 2 run scoreboard players set @s content_lock.temp1 8
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 3 run scoreboard players set @s content_lock.temp1 13
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 4 run scoreboard players set @s content_lock.temp1 20
scoreboard players operation @s content_lock.temp1 *= @s content_lock.enchantment.bonus.armor.diamond.stacks
execute store result storage content_lock:saved_stats data.value int 1 run scoreboard players get @s content_lock.temp1

function content_lock:player/passives/storage/player_data/append_to_path with storage content_lock:saved_stats
data remove storage content_lock:saved_stats data

tag @s add content_lock.enchantment.bonus.armor.diamond.taken_damage
execute on attacker run function content_lock:player/enchantments/bonuses/armor/diamond/attacker_debuff
tag @s remove content_lock.enchantment.bonus.armor.diamond.taken_damage

#tellraw @s {score:{"name":"@s","objective":"content_lock.enchantment.bonus.armor.diamond.stacks"}}

playsound item.armor.equip_diamond player @s ~ ~ ~ 1 1.6