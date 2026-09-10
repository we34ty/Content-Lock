scoreboard players operation @s content_lock.temp1 = @n[tag=content_lock.enchantment.bonus.armor.diamond.taken_damage] content_lock.enchantment.bonus.armor.diamond.pieces
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/effects/apply_frostbite {amount: 10}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/effects/apply_frostbite {amount: 20}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/effects/apply_frostbite {amount: 30}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/effects/apply_frostbite {amount: 40}