execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 1..2 run scoreboard players add @s content_lock.enchantment.bonus.armor.iron.stacks 1
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 3..4 run scoreboard players add @s content_lock.enchantment.bonus.armor.iron.stacks 2

execute if score @s content_lock.enchantment.bonus.armor.iron.stacks matches 21.. run scoreboard players set @s content_lock.enchantment.bonus.armor.iron.stacks 20
playsound entity.experience_orb.pickup player @a ~ ~ ~ 1 1.3

scoreboard players set @s content_lock.enchantment.bonus.armor.iron.fire_timer 5
scoreboard players set @s content_lock.enchantment.bonus.armor.iron.enemy_timer 10