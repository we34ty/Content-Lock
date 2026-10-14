execute unless score @s content_lock.enchantment.bonus.armor.chainmail.timer matches 1.. run function content_lock:player/weapons/entity/apply_armor_modifier {name:"content_lock.enchantment.bonus.weapon.stone.debuff",operation:"add",physical_damage:-5,fire_damage:-5,frost_damage:-5,magic_damage:-5,wither_damage:-5,ender_damage:-5,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}

execute store result score @s content_lock.temp1 run attribute @n attack_speed get 100
scoreboard players set @s content_lock.temp2 1200
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1

scoreboard players operation @s content_lock.enchantment.bonus.armor.chainmail.timer += @s content_lock.temp2