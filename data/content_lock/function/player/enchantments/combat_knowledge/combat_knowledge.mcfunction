execute if score @s content_lock.damage_amount_for_check matches 1.. run scoreboard players set @s content_lock.enchantment.combat_knowledge.fight_time 200
execute if score @s content_lock.enchantment.combat_knowledge.fight_time matches 1.. run scoreboard players add @s content_lock.enchantment.combat_knowledge 1
execute if score @s content_lock.enchantment.combat_knowledge matches 7001.. run scoreboard players remove @s content_lock.enchantment.combat_knowledge 1
execute if score @s content_lock.enchantment.combat_knowledge.fight_time matches 0 run function content_lock:player/enchantments/combat_knowledge/reset

#scoreboard players operation @s content_lock.enchantment.combat_knowledge.pieces *= @s content_lock.enchantment.combat_knowledge
#data merge storage content_lock:saved_stats {speed:0.0f}
#execute if score @s content_lock.enchantment.combat_knowledge matches 800.. store result storage content_lock:saved_stats speed float 0.00000012 run scoreboard players get @s content_lock.enchantment.combat_knowledge.pieces
#execute if score @s content_lock.enchantment.combat_knowledge matches 800.. run function content_lock:player/enchantments/combat_knowledge/bonus2 with storage content_lock:saved_stats
#execute if score @s content_lock.enchantment.combat_knowledge matches 800.. run scoreboard players set @s content_lock.enchantment.combat_knowledge.pieces 800
#execute store result storage content_lock:saved_stats speed float -0.00000125 run scoreboard players get @s content_lock.enchantment.combat_knowledge.pieces
#function content_lock:player/enchantments/combat_knowledge/bonus with storage content_lock:saved_stats

tag @s remove content_lock.enchantment.combat_knowledge