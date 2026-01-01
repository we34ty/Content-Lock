scoreboard players operation @s content_lock.enchantment.combat_knowledge.temp *= @s content_lock.enchantment.combat_knowledge
scoreboard players set @s content_lock.temp2 1000
scoreboard players operation @s content_lock.enchantment.combat_knowledge.temp /= @s content_lock.temp2

$execute if score @s content_lock.enchantment.combat_knowledge.temp = @s content_lock.enchantment.combat_knowledge.$(slot) run return 0

$item modify entity @s armor.$(slot) content_lock:combat_knowledge_resistance

$scoreboard players operation @s content_lock.enchantment.combat_knowledge.$(slot) = @s content_lock.enchantment.combat_knowledge.temp
