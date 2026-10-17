particle angry_villager ~ ~2 ~ 0.2 0.2 0.2 1 10 normal

scoreboard players add @s content_lock.enchantment.bonus.armor.chainmail.timer 10

## Apply the physical resistance reduction to the entity's armor
function content_lock:player/weapons/modifier/armor/apply {name:"content_lock.enchantment.bonus.weapon.stone.debuff",operation:"add",physical_damage:-5,fire_damage:-5,frost_damage:-5,magic_damage:-5,wither_damage:-5,ender_damage:-5,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}

## Apply the movement speed and attack damage reduction to the entity
execute unless entity @s[tag=content_lock.boss] run attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.chainmail -1 add_multiplied_total
execute unless entity @s[tag=content_lock.boss] run attribute @s knockback_resistance modifier add content_lock.enchantment.bonus.armor.chainmail 0.4 add_value
execute unless entity @s[tag=content_lock.boss] run return run attribute @s attack_damage modifier add content_lock.enchantment.bonus.armor.chainmail -1 add_multiplied_total

## Bosses gain reduced effects from the enchain effect, so we apply a smaller reduction to their movement speed and attack damage
attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.chainmail -0.6 add_multiplied_total
attribute @s attack_damage modifier add content_lock.enchantment.bonus.armor.chainmail -0.33 add_multiplied_total