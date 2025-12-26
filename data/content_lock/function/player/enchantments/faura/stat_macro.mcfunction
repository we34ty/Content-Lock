attribute @s knockback_resistance modifier remove content_lock.faura
$attribute @s knockback_resistance modifier add content_lock.faura $(knockback_resistance) add_value

tag @s add content_lock.enchantment.faura.stats

execute unless score L content_lock.timer1 matches 3 run return 0

$execute store result score @s content_lock.enchantment.faura.regen run random value -1..$(regen)
execute if score @s content_lock.enchantment.faura.regen matches 20.. run function content_lock:player/passives/heal_macro_easy {value:1}
#tellraw @a {score:{name:"@s",objective:"content_lock.enchantment.faura.regen"}}