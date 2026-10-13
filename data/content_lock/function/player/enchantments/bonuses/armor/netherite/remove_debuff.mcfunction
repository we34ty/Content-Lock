execute if entity @s[nbt={active_effects:[{id:"minecraft:slowness"}]}] run return 0

function content_lock:player/weapons/entity/remove_armor_modifier {name:"content_lock.enchantment.bonus.armor.netherite.debuff"}
tag @s remove content_lock.enchantment.bonus.armor.netherite.debuff