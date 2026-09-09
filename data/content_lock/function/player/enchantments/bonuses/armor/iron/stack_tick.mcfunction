scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.stack_cooldown 1
execute if score @s content_lock.enchantment.bonus.armor.iron.stack_cooldown matches 1.. run return 0

scoreboard players add @s content_lock.enchantment.bonus.armor.iron.stacks 1
execute if score @s content_lock.enchantment.bonus.armor.iron.stacks matches 21.. run scoreboard players set @s content_lock.enchantment.bonus.armor.iron.stacks 20

execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 1 run scoreboard players set @s content_lock.enchantment.bonus.armor.iron.stack_cooldown 180
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 2 run scoreboard players set @s content_lock.enchantment.bonus.armor.iron.stack_cooldown 140
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 3 run scoreboard players set @s content_lock.enchantment.bonus.armor.iron.stack_cooldown 100
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 4 run scoreboard players set @s content_lock.enchantment.bonus.armor.iron.stack_cooldown 60