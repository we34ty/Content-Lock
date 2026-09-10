scoreboard players set @s content_lock.temp1 12
scoreboard players operation @s content_lock.enchantment.bonus.armor.gold.stacks /= @s content_lock.temp1
scoreboard players set @s content_lock.temp1 11
execute unless score @s content_lock.enchantment.bonus.armor.gold.stacks matches ..5 run scoreboard players operation @s content_lock.enchantment.bonus.armor.gold.stacks *= @s content_lock.temp1
execute if score @s content_lock.enchantment.bonus.armor.gold.stacks matches ..5 run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.stacks 0