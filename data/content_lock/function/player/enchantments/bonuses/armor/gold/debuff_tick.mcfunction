scoreboard players remove @s content_lock.enchantment.bonus.armor.gold.debuff_timer 1
execute if score @s content_lock.enchantment.bonus.armor.gold.debuff_timer matches 1.. run return 0

function content_lock:player/enchantments/bonuses/armor/gold/remove_debuff
scoreboard players set @s content_lock.enchantment.bonus.armor.gold.debuff_stacks 0