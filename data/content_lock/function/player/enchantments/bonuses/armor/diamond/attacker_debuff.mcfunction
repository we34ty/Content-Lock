scoreboard players operation @s content_lock.temp1 = @n content_lock.enchantment.bonus.armor.diamond.pieces
execute if score @s content_lock.temp1 matches 1 run scoreboard players add @s content_lock.frostbite_stacks 10
execute if score @s content_lock.temp1 matches 2 run scoreboard players add @s content_lock.frostbite_stacks 20
execute if score @s content_lock.temp1 matches 3 run scoreboard players add @s content_lock.frostbite_stacks 30
execute if score @s content_lock.temp1 matches 4 run scoreboard players add @s content_lock.frostbite_stacks 40

tag @s remove content_lock.enchantment.bonus.armor.diamond.dealt_damage