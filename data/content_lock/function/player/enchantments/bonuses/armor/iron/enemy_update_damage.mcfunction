function content_lock:player/enchantments/bonuses/armor/iron/enemy_remove_buff

data merge storage content_lock:saved_stats {name:"content_lock.enchantment.bonus.armor.iron.enemy_damage",operation:"multiply",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0,value:0}
execute store result storage content_lock:saved_stats value double 0.1 run scoreboard players get @s content_lock.enchantment.bonus.armor.iron.enemy_stacks
function content_lock:player/enchantments/bonuses/armor/iron/attack_knockback_bufff with storage content_lock:saved_stats

scoreboard players operation @s content_lock.temp1 = @s content_lock.enchantment.bonus.armor.iron.enemy_stacks
scoreboard players set @s content_lock.temp2 6
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

execute store result storage content_lock:saved_stats physical_damage double 0.01 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats fire_damage double 0.01 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats frost_damage double 0.01 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats magic_damage double 0.01 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats wither_damage double 0.01 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats ender_damage double 0.01 run scoreboard players get @s content_lock.temp1

function content_lock:player/weapons/entity/apply_armor_modifier with storage content_lock:saved_stats