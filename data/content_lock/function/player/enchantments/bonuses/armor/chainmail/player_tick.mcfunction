## Apply enchain effect to all mobs around you if there is a hostile mob within the range of the chainmail armor set's effect
# based on the number of pieces of chainmail armor
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 1 if entity @n[type=#minecraft:hostile,distance=..2] run function content_lock:player/enchantments/bonuses/armor/chainmail/enchain {range:2.5,reduction:5,cooldown:400}
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 2 if entity @n[type=#minecraft:hostile,distance=..2.5] run function content_lock:player/enchantments/bonuses/armor/chainmail/enchain {range:3.2,reduction:10,cooldown:340}
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 3 if entity @n[type=#minecraft:hostile,distance=..3.2] run function content_lock:player/enchantments/bonuses/armor/chainmail/enchain {range:4,reduction:15,cooldown:280}
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 4 if entity @n[type=#minecraft:hostile,distance=..4] run function content_lock:player/enchantments/bonuses/armor/chainmail/enchain {range:5.3,reduction:20,cooldown:240}

scoreboard players set @s content_lock.enchantment.bonus.armor.chainmail.pieces 0
