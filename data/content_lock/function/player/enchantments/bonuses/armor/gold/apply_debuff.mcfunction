scoreboard players set @s content_lock.enchantment.bonus.armor.gold.debuff_timer 300
execute unless score @s content_lock.enchantment.bonus.armor.gold.debuff_stacks matches 5.. run scoreboard players add @s content_lock.enchantment.bonus.armor.gold.debuff_stacks 1

function content_lock:player/enchantments/bonuses/armor/gold/remove_debuff

particle flame ~ ~1 ~ 0.5 0.5 0.5 0.2 20 normal
playsound entity.generic.explode player @a ~ ~ ~ 1 1.3