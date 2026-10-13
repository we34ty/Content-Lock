execute unless score @s content_lock.enchantment.bonus.armor.netherite.timer_start matches 5.. if predicate content_lock:netherite_stillness run scoreboard players add @s content_lock.enchantment.bonus.armor.netherite.timer_start 1
execute if score @s content_lock.enchantment.bonus.armor.netherite.timer_start matches 5.. unless score @s content_lock.enchantment.bonus.armor.netherite.timer_instance matches 1.. run scoreboard players add @s content_lock.enchantment.bonus.armor.netherite.stacks 1
execute if score @s content_lock.enchantment.bonus.armor.netherite.timer_start matches 5.. run scoreboard players add @s content_lock.enchantment.bonus.armor.netherite.timer_instance 1
execute if score @s content_lock.enchantment.bonus.armor.netherite.timer_instance matches 2.. run scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.timer_instance 0

execute unless predicate content_lock:netherite_stillness run function content_lock:player/enchantments/bonuses/armor/netherite/moving

execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 1 if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 6.. run scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.stacks 5
execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 2 if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 8.. run scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.stacks 7
execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 3 if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 10.. run scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.stacks 9
execute if score @s content_lock.enchantment.bonus.armor.netherite.pieces matches 4 if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 12.. run scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.stacks 11

execute unless score @s content_lock.enchantment.bonus.armor.netherite.timer_start matches 5.. if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 1.. run scoreboard players remove @s content_lock.enchantment.bonus.armor.netherite.stacks 1

execute if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches ..6 if score @s content_lock.enchantment.bonus.armor.netherite.immune_timer matches 1.. run scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.immune_timer 0

execute if score @s content_lock.enchantment.bonus.armor.netherite.stacks matches 1.. run function content_lock:player/enchantments/bonuses/armor/netherite/buff

scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.pieces 0