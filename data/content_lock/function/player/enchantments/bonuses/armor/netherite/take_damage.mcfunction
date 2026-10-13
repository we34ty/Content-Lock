advancement revoke @s only content_lock:checks/bonuses/armor/damage_from_content_lock
function content_lock:player/weapons/entity/remove_armor_modifier {name:"content_lock.enchantment.bonus.armor.netherite.immune"}

scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.immune_timer 0
scoreboard players set @s content_lock.enchantment.bonus.armor.netherite.stacks 0
tag @s remove content_lock.enchantment.bonus.armor.netherite.immune