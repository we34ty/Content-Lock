execute if entity @s[nbt={active_effects:[{id:"minecraft:slowness"}]}] run return 0

function content_lock:player/weapons/modifier/armor/remove {name:"content_lock.enchantment.bonus.armor.netherite.debuff"}
tag @s remove content_lock.enchantment.bonus.armor.netherite.debuff