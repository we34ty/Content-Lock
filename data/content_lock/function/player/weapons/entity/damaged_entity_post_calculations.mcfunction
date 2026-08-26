scoreboard players set @s content_lock.check_for_damage_dealt 0
$scoreboard players add @s content_lock.check_for_damage_dealt $(physical_damage)
$scoreboard players add @s content_lock.check_for_damage_dealt $(fire_damage)
$scoreboard players add @s content_lock.check_for_damage_dealt $(frost_damage)
$scoreboard players add @s content_lock.check_for_damage_dealt $(magic_damage)
$scoreboard players add @s content_lock.check_for_damage_dealt $(wither_damage)
$scoreboard players add @s content_lock.check_for_damage_dealt $(ender_damage)

scoreboard players operation @s content_lock.enchantment.bonus.armor.leather.health_to_recover -= @s content_lock.check_for_damage_dealt
execute if score @s content_lock.enchantment.bonus.armor.leather.rally_timer matches 1.. if score @s content_lock.enchantment.bonus.armor.leather.health_to_recover matches ..0 run function content_lock:player/enchantments/bonuses/armor/leather/rally

execute if score @s content_lock.enchantment.bonus.armor.copper.pieces matches 1.. run scoreboard players operation @s content_lock.enchantment.bonus.armor.copper.charges += @s content_lock.check_for_damage_dealt