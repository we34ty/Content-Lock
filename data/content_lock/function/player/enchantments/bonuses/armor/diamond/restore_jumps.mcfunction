execute if entity @s[nbt={OnGround:0b}] run return 0

execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 1 run scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.jumps 1
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 2 run scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.jumps 1
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 3 run scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.jumps 2
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 4 run scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.jumps 3