scoreboard players add @s content_lock.enchantment.bonus.armor.leather.pieces 1

execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 1 run scoreboard players set @s content_lock.enchantment.bonus.armor.leather.rally_timer 10
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 2 run scoreboard players set @s content_lock.enchantment.bonus.armor.leather.rally_timer 24
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 3 run scoreboard players set @s content_lock.enchantment.bonus.armor.leather.rally_timer 40
execute if score @s content_lock.enchantment.bonus.armor.leather.pieces matches 4 run scoreboard players set @s content_lock.enchantment.bonus.armor.leather.rally_timer 60

execute unless score @s content_lock.enchantment.bonus.armor.leather.pieces matches 1 run return 0
particle block_crumble{block_state:"redstone_block"} ~ ~1 ~ 0.5 0.5 0.5 0.1 10 normal