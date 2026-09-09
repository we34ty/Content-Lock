## Set the timer for the enchain effect to 5 seconds
scoreboard players set @s content_lock.enchantment.bonus.armor.chainmail.timer 5

particle angry_villager ~ ~2 ~ 0.2 0.2 0.2 1 10 normal

## Apply the physical resistance reduction to the entity's armor
$data merge storage content_lock:saved_stats {name:"content_lock.enchantment.bonus.armor.chainmail",operation:"add",physical_damage:$(reduction),fire_damage:$(reduction),frost_damage:$(reduction),magic_damage:$(reduction),wither_damage:$(reduction),ender_damage:$(reduction),bleed_status:$(reduction),poison_status:$(reduction),corruption_status:$(reduction),wither_status:$(reduction),frostbite_status:$(reduction)}
function content_lock:player/weapons/entity/apply_armor_modifier with storage content_lock:saved_stats

## Apply the movement speed and attack damage reduction to the entity
execute unless entity @s[tag=content_lock.boss] run attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.chainmail -1 add_multiplied_total
execute unless entity @s[tag=content_lock.boss] run return run attribute @s attack_damage modifier add content_lock.enchantment.bonus.armor.chainmail -1 add_multiplied_total

## Bosses gain reduced effects from the enchain effect, so we apply a smaller reduction to their movement speed and attack damage
attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.chainmail -0.6 add_multiplied_total
attribute @s attack_damage modifier add content_lock.enchantment.bonus.armor.chainmail -0.33 add_multiplied_total