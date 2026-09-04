execute if entity @s[gamemode=creative] if entity @s[gamemode=spectator] run return 0

scoreboard players operation @s content_lock.temp1 = sprint.stamina.consumption lsp.Values
execute unless score @s content_lock.enchantment.bonus.armor.gold.reduction matches 0.. run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.reduction 1000
scoreboard players set @s content_lock.temp3 1000

scoreboard players operation @s content_lock.temp1 *= @s content_lock.enchantment.bonus.armor.gold.reduction
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp3

execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= @s content_lock.temp1
execute if score @s content_lock.jump_check matches 1.. run function lsp:jumping
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
#execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0
function content_lock:player/effects/stamina_draw
