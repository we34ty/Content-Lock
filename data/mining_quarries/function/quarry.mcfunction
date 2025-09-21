execute unless score @s content_lock.quarry_id matches 1.. run function mining_quarries:add_id
function mining_quarries:add_cooldown
function mining_quarries:align_rotation
execute at @s unless function mining_quarries:dont_mine_if run return fail
#execute unless items block ~ ~ ~ container.4 *[damage~{durability:{min:2}}] run return run function mining_quarries:broken

scoreboard players add @s content_lock.attack_timer 1

execute if score @s content_lock.attack_timer matches 3.. run tag @e remove content_lock.quarry.miner.current
execute if score @s content_lock.attack_timer matches 3.. as @e[type=minecraft:marker,tag=content_lock.quarry.miner,distance=..100] if score @s content_lock.quarry_id = @e[type=minecraft:marker,tag=content_lock.quarry,limit=1,sort=nearest,distance=..0.01] content_lock.quarry_id run tag @s add content_lock.quarry.miner.current
execute if score @s content_lock.attack_timer matches 3.. unless entity @e[type=minecraft:marker,tag=content_lock.quarry.miner.current,distance=..100] run function mining_quarries:summon_subid
execute if score @s content_lock.attack_timer matches 3.. as @e[type=minecraft:marker,tag=content_lock.quarry.miner.current,limit=1,sort=nearest,distance=..100] at @s run function mining_quarries:mine

#scoreboard players set @s content_lock.quarry_temp_var 0
#execute store result score @s content_lock.quarry_temp_var run data get block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:fortune"
#scoreboard players add @s content_lock.quarry_temp_var 1
#function mining_quarries:spawn_loot_loop

execute if function mining_quarries:should_filter unless items block ~ ~ ~ container.7 minecraft:redstone_torch as @e[type=minecraft:item,distance=..0.1] run function mining_quarries:filter_item with entity @s Item
execute if function mining_quarries:should_filter if items block ~ ~ ~ container.7 minecraft:redstone_torch as @e[type=minecraft:item,distance=..0.1] run function mining_quarries:blacklist_item with entity @s Item
execute as @e[type=minecraft:item,distance=..0.1] if entity @s[nbt={Item:{components:{}}}] run function mining_quarries:stow_item_components with entity @s Item
execute as @e[type=minecraft:item,distance=..0.1] unless entity @s[nbt={Item:{components:{}}}] run function mining_quarries:stow_item with entity @s Item

#function mining_quarries:take_unbreaking_damage
playsound minecraft:block.content_lock.quarry.break ambient @a ~ ~ ~ 0.2 0.6