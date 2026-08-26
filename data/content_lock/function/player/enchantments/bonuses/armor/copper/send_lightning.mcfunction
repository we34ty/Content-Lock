scoreboard players set @s content_lock.temp1 0
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 1 run scoreboard players set @s content_lock.temp1 5000
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 2 run scoreboard players set @s content_lock.temp1 8000
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 3 run scoreboard players set @s content_lock.temp1 11000
execute if score @s content_lock.enchantment.bonus.armor.chainmail.pieces matches 4 run scoreboard players set @s content_lock.temp1 15000

scoreboard players operation @s content_lock.temp2 = @s content_lock.mvtspd_from_level
scoreboard players set @s content_lock.temp3 10
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp3
scoreboard players add @s content_lock.temp2 1000

scoreboard players set @s content_lock.temp3 1000
scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

data merge storage content_lock:saved_stats {fire_damage:0.0f,magic_damage:0.0f}
execute store result storage content_lock:saved_stats fire_damage float 0.0005 run scoreboard players get @s content_lock.temp1
execute store result storage content_lock:saved_stats magic_damage float 0.0005 run scoreboard players get @s content_lock.temp1

