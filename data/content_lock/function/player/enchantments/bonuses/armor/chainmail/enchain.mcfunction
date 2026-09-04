## Set the cooldown and applies the enchain effect to all hostile mobs within the range
$scoreboard players set @s content_lock.enchantment.bonus.armor.chainmail.cooldown $(cooldown)
$execute as @e[type=#minecraft:hostile,distance=..$(range)] at @s run function content_lock:player/enchantments/bonuses/armor/chainmail/enchain_entity {reduction:$(reduction)}

playsound block.grindstone.use player @a ~ ~ ~ 1 0.6
playsound entity.elder_guardian.death player @a ~ ~ ~ 1 1.6