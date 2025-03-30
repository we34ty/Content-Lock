execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:7}
execute if score @s content_lock.temp1 matches 1 run item replace entity @s armor.head with minecraft:leather_helmet
execute if score @s content_lock.temp1 matches 2 run item replace entity @s armor.head with minecraft:chainmail_helmet
execute if score @s content_lock.temp1 matches 3 run item replace entity @s armor.head with minecraft:iron_helmet
execute if score @s content_lock.temp1 matches 4 run item replace entity @s armor.head with minecraft:golden_helmet
execute if score @s content_lock.temp1 matches 5 run item replace entity @s armor.head with minecraft:diamond_helmet
execute if score @s content_lock.temp1 matches 6 run item replace entity @s armor.head with minecraft:netherite_helmet

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:7}
execute if score @s content_lock.temp1 matches 1 run item replace entity @s armor.chest with minecraft:leather_chestplate
execute if score @s content_lock.temp1 matches 2 run item replace entity @s armor.chest with minecraft:chainmail_chestplate
execute if score @s content_lock.temp1 matches 3 run item replace entity @s armor.chest with minecraft:iron_chestplate
execute if score @s content_lock.temp1 matches 4 run item replace entity @s armor.chest with minecraft:golden_chestplate
execute if score @s content_lock.temp1 matches 5 run item replace entity @s armor.chest with minecraft:diamond_chestplate
execute if score @s content_lock.temp1 matches 6 run item replace entity @s armor.chest with minecraft:netherite_chestplate

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:7}
execute if score @s content_lock.temp1 matches 1 run item replace entity @s armor.legs with minecraft:leather_leggings
execute if score @s content_lock.temp1 matches 2 run item replace entity @s armor.legs with minecraft:chainmail_leggings
execute if score @s content_lock.temp1 matches 3 run item replace entity @s armor.legs with minecraft:iron_leggings
execute if score @s content_lock.temp1 matches 4 run item replace entity @s armor.legs with minecraft:golden_leggings
execute if score @s content_lock.temp1 matches 5 run item replace entity @s armor.legs with minecraft:diamond_leggings
execute if score @s content_lock.temp1 matches 6 run item replace entity @s armor.legs with minecraft:netherite_leggings

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:7}
execute if score @s content_lock.temp1 matches 1 run item replace entity @s armor.feet with minecraft:leather_boots
execute if score @s content_lock.temp1 matches 2 run item replace entity @s armor.feet with minecraft:chainmail_boots
execute if score @s content_lock.temp1 matches 3 run item replace entity @s armor.feet with minecraft:iron_boots
execute if score @s content_lock.temp1 matches 4 run item replace entity @s armor.feet with minecraft:golden_boots
execute if score @s content_lock.temp1 matches 5 run item replace entity @s armor.feet with minecraft:diamond_boots
execute if score @s content_lock.temp1 matches 6 run item replace entity @s armor.feet with minecraft:netherite_boots

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:7}
execute store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches 1 run item replace entity @s weapon.mainhand with minecraft:wooden_sword
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches 2 run item replace entity @s weapon.mainhand with minecraft:stone_sword
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches 3 run item replace entity @s weapon.mainhand with minecraft:iron_sword
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches 4 run item replace entity @s weapon.mainhand with minecraft:golden_sword
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches 5 run item replace entity @s weapon.mainhand with minecraft:diamond_sword
execute if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches 6 run item replace entity @s weapon.mainhand with minecraft:netherite_sword

execute if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches 1 run item replace entity @s weapon.mainhand with minecraft:wooden_axe
execute if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches 2 run item replace entity @s weapon.mainhand with minecraft:stone_axe
execute if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches 3 run item replace entity @s weapon.mainhand with minecraft:iron_axe
execute if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches 4 run item replace entity @s weapon.mainhand with minecraft:golden_axe
execute if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches 5 run item replace entity @s weapon.mainhand with minecraft:diamond_axe
execute if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches 6 run item replace entity @s weapon.mainhand with minecraft:netherite_axe

execute if score @s content_lock.temp2 matches 3 if score @s content_lock.temp1 matches 1 run item replace entity @s weapon.mainhand with minecraft:wooden_pickaxe
execute if score @s content_lock.temp2 matches 3 if score @s content_lock.temp1 matches 2 run item replace entity @s weapon.mainhand with minecraft:stone_pickaxe
execute if score @s content_lock.temp2 matches 3 if score @s content_lock.temp1 matches 3 run item replace entity @s weapon.mainhand with minecraft:iron_pickaxe
execute if score @s content_lock.temp2 matches 3 if score @s content_lock.temp1 matches 4 run item replace entity @s weapon.mainhand with minecraft:golden_pickaxe
execute if score @s content_lock.temp2 matches 3 if score @s content_lock.temp1 matches 5 run item replace entity @s weapon.mainhand with minecraft:diamond_pickaxe
execute if score @s content_lock.temp2 matches 3 if score @s content_lock.temp1 matches 6 run item replace entity @s weapon.mainhand with minecraft:netherite_pickaxe

execute if score @s content_lock.temp2 matches 4 if score @s content_lock.temp1 matches 1 run item replace entity @s weapon.mainhand with minecraft:wooden_shovel
execute if score @s content_lock.temp2 matches 4 if score @s content_lock.temp1 matches 2 run item replace entity @s weapon.mainhand with minecraft:stone_shovel
execute if score @s content_lock.temp2 matches 4 if score @s content_lock.temp1 matches 3 run item replace entity @s weapon.mainhand with minecraft:iron_shovel
execute if score @s content_lock.temp2 matches 4 if score @s content_lock.temp1 matches 4 run item replace entity @s weapon.mainhand with minecraft:golden_shovel
execute if score @s content_lock.temp2 matches 4 if score @s content_lock.temp1 matches 5 run item replace entity @s weapon.mainhand with minecraft:diamond_shovel
execute if score @s content_lock.temp2 matches 4 if score @s content_lock.temp1 matches 6 run item replace entity @s weapon.mainhand with minecraft:netherite_shovel

execute if score @s content_lock.temp2 matches 5 if score @s content_lock.temp1 matches 1 run item replace entity @s weapon.mainhand with minecraft:wooden_hoe
execute if score @s content_lock.temp2 matches 5 if score @s content_lock.temp1 matches 2 run item replace entity @s weapon.mainhand with minecraft:stone_hoe
execute if score @s content_lock.temp2 matches 5 if score @s content_lock.temp1 matches 3 run item replace entity @s weapon.mainhand with minecraft:iron_hoe
execute if score @s content_lock.temp2 matches 5 if score @s content_lock.temp1 matches 4 run item replace entity @s weapon.mainhand with minecraft:golden_hoe
execute if score @s content_lock.temp2 matches 5 if score @s content_lock.temp1 matches 5 run item replace entity @s weapon.mainhand with minecraft:diamond_hoe
execute if score @s content_lock.temp2 matches 5 if score @s content_lock.temp1 matches 6 run item replace entity @s weapon.mainhand with minecraft:netherite_hoe

data merge entity @s {HandDropChances:[0.0F,0.0F],ArmorDropChances:[0.0F,0.0F,0.0F,0.0F]}