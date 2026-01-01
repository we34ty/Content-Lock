execute if entity @s[tag=content_lock.enchantment.combat_knowledge] run return 0

tag @s add content_lock.enchantment.combat_knowledge
tag @s add content_lock.enchantment.active

scoreboard players set @s content_lock.enchantment.combat_knowledge.pieces 0

scoreboard players set @s content_lock.enchantment.combat_knowledge.temp 0
execute store result score @s content_lock.enchantment.combat_knowledge.temp run data get entity @s equipment.head.components."minecraft:enchantments"."content_lock:combat_knowledge"
scoreboard players operation @s content_lock.enchantment.combat_knowledge.pieces += @s content_lock.enchantment.combat_knowledge.temp

execute if score @s content_lock.enchantment.combat_knowledge.temp matches 1.. if score @s content_lock.enchantment.combat_knowledge matches 1.. run function content_lock:player/enchantments/combat_knowledge/enchant {slot:head}

scoreboard players set @s content_lock.enchantment.combat_knowledge.temp 0
execute store result score @s content_lock.enchantment.combat_knowledge.temp run data get entity @s equipment.chest.components."minecraft:enchantments"."content_lock:combat_knowledge"
scoreboard players operation @s content_lock.enchantment.combat_knowledge.pieces += @s content_lock.enchantment.combat_knowledge.temp

execute if score @s content_lock.enchantment.combat_knowledge.temp matches 1.. if score @s content_lock.enchantment.combat_knowledge matches 1.. run function content_lock:player/enchantments/combat_knowledge/enchant {slot:chest}

scoreboard players set @s content_lock.enchantment.combat_knowledge.temp 0
execute store result score @s content_lock.enchantment.combat_knowledge.temp run data get entity @s equipment.legs.components."minecraft:enchantments"."content_lock:combat_knowledge"
scoreboard players operation @s content_lock.enchantment.combat_knowledge.pieces += @s content_lock.enchantment.combat_knowledge.temp

execute if score @s content_lock.enchantment.combat_knowledge.temp matches 1.. if score @s content_lock.enchantment.combat_knowledge matches 1.. run function content_lock:player/enchantments/combat_knowledge/enchant {slot:legs}

scoreboard players set @s content_lock.enchantment.combat_knowledge.temp 0
execute store result score @s content_lock.enchantment.combat_knowledge.temp run data get entity @s equipment.feet.components."minecraft:enchantments"."content_lock:combat_knowledge"
scoreboard players operation @s content_lock.enchantment.combat_knowledge.pieces += @s content_lock.enchantment.combat_knowledge.temp

execute if score @s content_lock.enchantment.combat_knowledge.temp matches 1.. if score @s content_lock.enchantment.combat_knowledge matches 1.. run function content_lock:player/enchantments/combat_knowledge/enchant {slot:feet}