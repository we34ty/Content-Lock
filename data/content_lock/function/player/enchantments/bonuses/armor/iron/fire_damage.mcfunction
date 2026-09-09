execute if entity @s[tag=content_lock.enchantment.bonus.armor.iron.damaged_already] run return 0
tag @s add content_lock.enchantment.bonus.armor.iron.damaged_already

execute unless score @s content_lock.enchantment.bonus.armor.iron.stacks matches 1.. run return 0

scoreboard players set @s content_lock.enchantment.bonus.armor.iron.fire_timer 5
effect give @s fire_resistance 5 0

data merge storage content_lock:saved_stats {UUID:0,path:"weapon.damage_modifiers.fire",data:{name:"content_lock.enchantment.bonus.armor.iron.fire_buff_add",operation:"add",value:0}}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 1 run data modify storage content_lock:saved_stats data.value set value 1
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 2 run data modify storage content_lock:saved_stats data.value set value 1.5
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 3 run data modify storage content_lock:saved_stats data.value set value 2
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 4 run data modify storage content_lock:saved_stats data.value set value 2.5

function content_lock:player/passives/storage/player_data/append_to_path with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {data:{name:"content_lock.enchantment.bonus.armor.iron.fire_buff_mult",operation:"multiply",value:1}}
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 1 run data modify storage content_lock:saved_stats data.value set value 1.05
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 2 run data modify storage content_lock:saved_stats data.value set value 1.08
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 3 run data modify storage content_lock:saved_stats data.value set value 1.12
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 4 run data modify storage content_lock:saved_stats data.value set value 1.2

function content_lock:player/passives/storage/player_data/append_to_path with storage content_lock:saved_stats
data remove storage content_lock:saved_stats data

particle flame ~ ~1 ~ 0.5 0.5 0.5 0.2 20 normal
playsound entity.generic.explode player @a ~ ~ ~ 1 1.3