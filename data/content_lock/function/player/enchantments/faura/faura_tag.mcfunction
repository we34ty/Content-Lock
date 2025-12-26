tag @s add content_lock.enchantment.faura
tag @s add content_lock.enchantment.active

scoreboard players set @s content_lock.enchantment.faura.pieces 0

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run data get entity @s equipment.head.components."minecraft:enchantments"."content_lock:faura"
scoreboard players operation @s content_lock.enchantment.faura.pieces += @s content_lock.temp1

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run data get entity @s equipment.chest.components."minecraft:enchantments"."content_lock:faura"
scoreboard players operation @s content_lock.enchantment.faura.pieces += @s content_lock.temp1

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run data get entity @s equipment.legs.components."minecraft:enchantments"."content_lock:faura"
scoreboard players operation @s content_lock.enchantment.faura.pieces += @s content_lock.temp1

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run data get entity @s equipment.feet.components."minecraft:enchantments"."content_lock:faura"
scoreboard players operation @s content_lock.enchantment.faura.pieces += @s content_lock.temp1

