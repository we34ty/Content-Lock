execute if score @s content_lock.enchantment.bonus.armor.copper.charges matches 251.. run scoreboard players set @s content_lock.enchantment.bonus.armor.copper.charges 250

execute unless score @s content_lock.enchantment.bonus.armor.copper.charges <= @s content_lock.enchantment.bonus.armor.copper.charges_old run function content_lock:player/enchantments/bonuses/armor/copper/gained_charges
scoreboard players operation @s content_lock.enchantment.bonus.armor.copper.charges_old = @s content_lock.enchantment.bonus.armor.copper.charges

function content_lock:player/enchantments/bonuses/armor/copper/remove_stats

execute if entity @s[tag=content_lock.enchantment.bonus.armor.copper.send_lightning] run function content_lock:player/enchantments/bonuses/armor/copper/send_lightning

execute if score @s content_lock.enchantment.bonus.armor.copper.charges matches 50.. run function content_lock:player/enchantments/bonuses/armor/copper/update_stats

execute if score @s content_lock.enchantment.bonus.armor.copper.timer matches 0 run scoreboard players remove @s content_lock.enchantment.bonus.armor.copper.charges 2
execute if score @s content_lock.enchantment.bonus.armor.copper.timer matches 1.. run scoreboard players remove @s content_lock.enchantment.bonus.armor.copper.timer 1