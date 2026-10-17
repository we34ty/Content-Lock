scoreboard players remove @s content_lock.enchantment.bonus.armor.chainmail.timer 1

## If the timer is not 0, return and do not remove the enchain effect
execute unless score @s content_lock.enchantment.bonus.armor.chainmail.timer matches 0 run return 0

## Remove the enchain effect from all hostile mobs within the range
function content_lock:player/weapons/modifier/armor/remove {name: "content_lock:enchantment.bonus.armor.chainmail"}
function content_lock:player/weapons/modifier/armor/remove {name: "content_lock:enchantment.bonus.weapon.stone.debuff"}

## Remove the movement speed and attack damage reduction from the entity
attribute @s movement_speed modifier remove content_lock.enchantment.bonus.armor.chainmail
attribute @s attack_damage modifier remove content_lock.enchantment.bonus.armor.chainmail