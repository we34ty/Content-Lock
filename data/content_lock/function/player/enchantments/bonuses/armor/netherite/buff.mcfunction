data merge storage content_lock:saved_stats {damage_resistance:0,knockback_resistance:0,wither_reduction:0}
execute store result storage content_lock:saved_stats damage_resistance float 0.03 run scoreboard players get @s content_lock.enchantment.bonus.armor.netherite.stacks
execute store result storage content_lock:saved_stats knockback_resistance float 0.03 run scoreboard players get @s content_lock.enchantment.bonus.armor.netherite.stacks

function content_lock:player/enchantments/bonuses/armor/netherite/buff_macro with storage content_lock:saved_stats
tag @s add content_lock.enchantment.bonus.armor.netherite.buff

execute if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches ..5 run return 0

scoreboard players set @s content_lock.temp1 -3
scoreboard players operation @s content_lock.temp1 += @s content_lock.enchantment.bonus.armor.netherite.stacks
execute store result storage content_lock:saved_stats wither_reduction float -0.037 run scoreboard players get @s content_lock.temp1

execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 1 at @s positioned ~-3 ~-3 ~-3 as @e[type=#hostile,dx=6,dz=6,dy=6] run function content_lock:player/enchantments/bonuses/armor/netherite/debuff with storage content_lock:saved_stats
execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 2 at @s positioned ~-3.5 ~-3.5 ~-3.5 as @e[type=#hostile,dx=7,dz=7,dy=7] run function content_lock:player/enchantments/bonuses/armor/netherite/debuff with storage content_lock:saved_stats
execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 3 at @s positioned ~-4 ~-4 ~-4 as @e[type=#hostile,dx=8,dz=8,dy=8] run function content_lock:player/enchantments/bonuses/armor/netherite/debuff with storage content_lock:saved_stats
execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 4 at @s positioned ~-5 ~-5 ~-5 as @e[type=#hostile,dx=10,dz=10,dy=10] run function content_lock:player/enchantments/bonuses/armor/netherite/debuff with storage content_lock:saved_stats

execute if entity @s[tag=content_lock.enchantment.bonus.armor.netherite.immune] run return 0
execute unless score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 7.. run return 0
scoreboard players add @s content_lock.enchantment.bonus.armor.netherite.immune_timer 1
execute if score @s content_lock.enchantment.bonus.armor.netherite.immune_timer matches 15.. run function content_lock:player/enchantments/bonuses/armor/netherite/apply_immunity