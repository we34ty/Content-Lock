scoreboard players set @s content_lock.enchantment.combat_knowledge 0
attribute @s movement_speed modifier remove content_lock.combat_knowledge
attribute @s movement_speed modifier remove content_lock.combat_knowledge2

execute at @s run playsound block.note_block.banjo player @s ~ ~ ~ 1 0.5

scoreboard players remove @s content_lock.enchantment.combat_knowledge.fight_time 1