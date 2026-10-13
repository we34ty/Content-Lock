effect give @s invisibility infinite 0 true
scoreboard players add @s content_lock.enchantment.bonus.armor.quartz.heal_timer 1

$execute unless score @s content_lock.enchantment.bonus.armor.quartz.heal_timer matches $(timer).. run return 0
function content_lock:player/passives/heal_macro_easy {value:1000}
scoreboard players set @s content_lock.enchantment.bonus.armor.quartz.heal_timer 0