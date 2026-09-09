execute unless score @s content_lock.enchantment.bonus.armor.iron.enemy_stacks matches 1.. run return 0
scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.enemy_timer 1

execute unless score @s content_lock.enchantment.bonus.armor.iron.enemy_timer matches ..0 run return 0

scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.enemy_stacks 1
execute if score @s content_lock.enchantment.bonus.armor.iron.enemy_stacks matches 0 run return run function content_lock:player/enchantments/bonuses/armor/iron/enemy_remove_buff

scoreboard players set @s content_lock.enchantment.bonus.armor.iron.enemy_timer 10
function content_lock:player/enchantments/bonuses/armor/iron/enemy_update_damage