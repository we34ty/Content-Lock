execute if entity @s[scores={content_lock.crashful_counter=1..}] run function content_lock:player/enchantments/crashful_recover
execute if entity @s[type=#content_lock:invisibility,team=!content_lock.invisibility] run team join content_lock.invisibility

execute if score @s content_lock.enchantment.bonus.armor.gold.debuff_timer matches 1.. run function content_lock:player/enchantments/bonuses/armor/gold/debuff_tick
execute if entity @s[tag=content_lock.enchantment.bonus.armor.netherite.debuff] run function content_lock:player/enchantments/bonuses/armor/netherite/remove_debuff

function content_lock:player/effects/tick
