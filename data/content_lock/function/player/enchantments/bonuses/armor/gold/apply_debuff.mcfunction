scoreboard players set @s content_lock.enchantment.bonus.armor.gold.debuff_timer 15
execute unless score @s content_lock.enchantment.bonus.armor.gold.debuff_stacks matches 5.. run scoreboard players add @s content_lock.enchantment.bonus.armor.gold.debuff_stacks 1

function content_lock:player/enchantments/bonuses/armor/gold/remove_debuff

data merge storage content_lock:saved_stats {name:"content_lock.enchantment.bonus.armor.gold.debuff",operation:"add",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
execute store result storage content_lock:saved_stats physical_damage double -20 run scoreboard players get @s content_lock.enchantment.bonus.armor.gold.debuff_stacks
function content_lock:player/weapons/entity/apply_armor_modifier with storage content_lock:saved_stats

particle flame ~ ~1 ~ 0.5 0.5 0.5 0.2 20 normal
playsound entity.generic.explode player @a ~ ~ ~ 1 1.3