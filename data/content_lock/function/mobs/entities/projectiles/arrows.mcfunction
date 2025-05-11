tag @e remove content_lock.owner
data merge storage content_lock:saved_stats {UUID:0}
data modify storage content_lock:saved_stats UUID set from entity @s Owner
function content_lock:mobs/entities/projectiles/set_owner with storage content_lock:saved_stats

scoreboard players set @s content_lock.temp2 25000
execute if entity @e[tag=content_lock.owner] store result score @s content_lock.temp1 run attribute @e[tag=content_lock.owner,limit=1,sort=nearest] attack_speed get 1000
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1

execute if entity @e[tag=content_lock.owner] if score @e[tag=content_lock.owner,limit=1,sort=nearest] content_lock.bow_charge >= @s content_lock.temp2 run function content_lock:mobs/entities/projectiles/full_charge
execute if entity @e[tag=content_lock.owner] unless score @e[tag=content_lock.owner,limit=1,sort=nearest] content_lock.bow_charge >= @s content_lock.temp2 run function content_lock:mobs/entities/projectiles/no_charge

execute if entity @e[tag=content_lock.owner] run tag @s add content_lock.arrow.changed_damage

execute if entity @e[tag=content_lock.owner] run scoreboard players set @e[tag=content_lock.owner] content_lock.bow_charge 0

execute if score L content_lock.options.player.stamina matches 1.. as @e[tag=content_lock.owner] run function lsp:attacking