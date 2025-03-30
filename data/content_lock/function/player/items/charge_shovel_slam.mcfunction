$execute at @s as @e[distance=0.1..$(range),type=!#entities] run damage @s $(damage) player_attack by @p[nbt={UUID:$(UUID)}]
$execute at @s as @e[distance=0.1..$(range)] run data modify entity @s Motion[1] set value $(knockback)
execute at @s run particle block{block_state:dirt} ~ ~ ~ 2 1 2 1 30 normal @a
execute at @s run particle crit ~ ~ ~ 2 1 2 0.1 30 normal @a
execute at @s run playsound entity.player.attack.crit player @a ~ ~ ~ 1 0.3
execute at @s run playsound block.stone.break player @a ~ ~ ~ 1 0.3
execute at @s run playsound entity.iron_golem.damage player @a ~ ~ ~ 1 0.3

function content_lock:player/items/reduce_weapon_durability {damage:2}

execute store result score @s content_lock.temp1 run data get storage content_lock:saved_stats attack_speed 60
scoreboard players set @s[scores={content_lock.temp1=121..}] content_lock.temp1 120
scoreboard players set @s content_lock.temp2 140
scoreboard players operation @s content_lock.temp2 -= @s content_lock.temp1
execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= @s content_lock.temp2
execute if score @s lsp.stamina matches ..0 run function lsp:change_speed with storage lsp:macro stamina
execute if score @s lsp.stamina matches ..0 run scoreboard players set @s lsp.stamina 0
execute if score @s content_lock.stamina_delay_timer matches 1.. run scoreboard players set @s content_lock.stamina_delay_timer 0
