## Heal player for the amount of health lost from the last hit
data merge storage content_lock:saved_stats {value:0.0f}
## Make max player health temporarily lower for 2 ticks to allow the game to catch up with healing
tag @s add content_lock.remove_health_deprived_2_ticks
execute store result storage content_lock:saved_stats value float 1000 run scoreboard players get @s content_lock.enchantment.bonus.armor.leather.health_storage
function content_lock:player/passives/heal_macro_easy with storage content_lock:saved_stats

## Remove the health storage and pieces of leather armor from the player as well as give player a buff
## for 4 seconds that increases their bleed application based on the number of pieces of leather armor they are wearing
scoreboard players set @s content_lock.enchantment.bonus.armor.leather.buff_timer 80
scoreboard players set @s content_lock.enchantment.bonus.armor.leather.rally_timer 0

scoreboard players set @s content_lock.enchantment.bonus.armor.leather.health_storage 0
scoreboard players set @s content_lock.enchantment.bonus.armor.leather.pieces 0
execute if items entity @s armor.head leather_helmet run scoreboard players add @s content_lock.enchantment.bonus.armor.leather.pieces 1
execute if items entity @s armor.chest leather_chestplate run scoreboard players add @s content_lock.enchantment.bonus.armor.leather.pieces 1
execute if items entity @s armor.legs leather_leggings run scoreboard players add @s content_lock.enchantment.bonus.armor.leather.pieces 1
execute if items entity @s armor.feet leather_boots run scoreboard players add @s content_lock.enchantment.bonus.armor.leather.pieces 1

## Remove bleed stacks based on the number of pieces of leather armor
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 1 run scoreboard players remove @s content_lock.bleed_stacks 20
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 2 run scoreboard players remove @s content_lock.bleed_stacks 25
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 3 run scoreboard players remove @s content_lock.bleed_stacks 30
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 4 run scoreboard players remove @s content_lock.bleed_stacks 40

## Remove the buff before adding it again so it gets updated properly
function content_lock:player/enchantments/bonuses/armor/leather/remove_buff
data remove storage content_lock:saved_stats data
data merge storage content_lock:saved_stats {UUID:0, path:"weapon.status_effect_modifiers.bleed",data:{name:"content_lock.enchantment.bonus.armor.leather",operation:"multiply",value:1.0f}}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 1 run data merge storage content_lock:saved_stats {data:{operation:"multiply", value:1.15f, name:"content_lock.enchantment.bonus.armor.leather"}}
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 2 run data merge storage content_lock:saved_stats {data:{operation:"multiply", value:1.26f, name:"content_lock.enchantment.bonus.armor.leather"}}
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 3 run data merge storage content_lock:saved_stats {data:{operation:"multiply", value:1.39f, name:"content_lock.enchantment.bonus.armor.leather"}}
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 4 run data merge storage content_lock:saved_stats {data:{operation:"multiply", value:1.5f, name:"content_lock.enchantment.bonus.armor.leather"}}

## Save the buff to the player's data
function content_lock:player/passives/storage/player_data/append_to_path with storage content_lock:saved_stats
data remove storage content_lock:saved_stats data

execute at @s run playsound entity.generic.drink player @a ~ ~ ~ 1 0.66
execute at @s run playsound entity.player.burp player @a ~ ~ ~ 1 0.4
execute at @s run particle crit ~ ~2 ~ 0.1 0.1 0.1 0.3 10 normal