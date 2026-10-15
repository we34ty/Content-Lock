execute unless score @s content_lock.enchantment.bonus.armor.chainmail.timer matches 1.. at @s run function content_lock:player/enchantments/bonuses/weapon/stone/enchain_entity

execute store result score @s content_lock.temp1 run attribute @n attack_speed get 100
scoreboard players set @s content_lock.temp2 1200
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
scoreboard players set @s content_lock.temp1 5
scoreboard players operation @s content_lock.temp2 > @s content_lock.temp1

scoreboard players operation @s content_lock.enchantment.bonus.armor.chainmail.timer += @s content_lock.temp2