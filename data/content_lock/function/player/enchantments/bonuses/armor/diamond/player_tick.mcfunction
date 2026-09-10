execute if score @s content_lock.enchantment.bonus.armor.diamond.safe matches 1 run function content_lock:player/enchantments/bonuses/armor/diamond/remove_fall_reduction
execute if score @s content_lock.enchantment.bonus.armor.diamond.safe matches 1.. run scoreboard players remove @s content_lock.enchantment.bonus.armor.diamond.safe 1
execute if score @s content_lock.enchantment.bonus.armor.diamond.cooldown matches 1.. run scoreboard players remove @s content_lock.enchantment.bonus.armor.diamond.cooldown 1
execute if entity @s[x_rotation=-90..-40] if entity @s[nbt={OnGround:0b}] if score @s content_lock.enchantment.bonus.armor.diamond.jumps matches 1.. run function content_lock:player/enchantments/bonuses/armor/diamond/jump

execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 1 unless score @s content_lock.enchantment.bonus.armor.diamond.jumps matches 1.. run function content_lock:player/enchantments/bonuses/armor/diamond/restore_jumps
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 2 unless score @s content_lock.enchantment.bonus.armor.diamond.jumps matches 1.. run function content_lock:player/enchantments/bonuses/armor/diamond/restore_jumps
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 3 unless score @s content_lock.enchantment.bonus.armor.diamond.jumps matches 2.. run function content_lock:player/enchantments/bonuses/armor/diamond/restore_jumps
execute if score @s content_lock.enchantment.bonus.armor.diamond.pieces matches 4 unless score @s content_lock.enchantment.bonus.armor.diamond.jumps matches 3.. run function content_lock:player/enchantments/bonuses/armor/diamond/restore_jumps

execute unless entity @s[tag=content_lock.enchantment.bonus.armor.diamond.checked_tick] run scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.pieces 0
tag @s remove content_lock.enchantment.bonus.armor.diamond.checked_tick