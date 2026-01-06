advancement revoke @s only content_lock:checks/entity_hurt_player

scoreboard players operation @s content_lock.health_percentage_old = @s content_lock.health_percentage
execute store result score @s content_lock.temp1 run attribute @s max_health get
execute store result score @s content_lock.health_percentage run data get entity @s Health 100
scoreboard players operation @s content_lock.health_percentage /= @s content_lock.temp1

scoreboard players operation @s content_lock.temp2 = @s content_lock.health_percentage_old
scoreboard players operation @s content_lock.temp2 -= @s content_lock.health_percentage
execute if score @s content_lock.temp2 matches ..0 run return 0

#scoreboard players set @s content_lock.temp1 3
#scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1
#scoreboard players set @s content_lock.temp1 2
#scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
execute unless score @s content_lock.enchantment.bloodthirst.fight_time matches 1.. run scoreboard players set @s[tag=content_lock.enchantment.bloodthirst] content_lock.enchantment.bloodthirst.kills 0
scoreboard players set @s[tag=content_lock.enchantment.bloodthirst] content_lock.enchantment.bloodthirst.fight_time 200
scoreboard players set @s[tag=content_lock.enchantment.combat_knowledge] content_lock.enchantment.combat_knowledge.fight_time 200
scoreboard players set @s content_lock.fight_time 200

execute if score L content_lock.options.player.bleed matches 1 run scoreboard players operation @s content_lock.bleed_stacks += @s content_lock.temp2

scoreboard players set @s content_lock.temp1 10
scoreboard players operation @s content_lock.temp2 *= @s content_lock.temp1
tag @e remove content_lock.attacker
execute on attacker run tag @s add content_lock.attacker
execute if score L content_lock.options.player.stamina matches 1.. if entity @e[tag=content_lock.attacker,limit=1,sort=nearest,tag=content_lock.deals_stamina_damage] run scoreboard players operation @s lsp.stamina -= @s content_lock.temp2
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina