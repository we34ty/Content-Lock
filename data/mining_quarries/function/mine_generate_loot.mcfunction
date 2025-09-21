scoreboard players set @s content_lock.temp1 0
execute at @e[tag=content_lock.quarry,limit=1,sort=nearest] if items block ~ ~ ~ container.4 *[enchantments={fortune:1}] unless items block ~ ~ ~ container.4 *[enchantments={silk_touch:1}] run scoreboard players set @s content_lock.temp1 1
execute at @e[tag=content_lock.quarry,limit=1,sort=nearest] if items block ~ ~ ~ container.4 *[enchantments={fortune:2}] unless items block ~ ~ ~ container.4 *[enchantments={silk_touch:1}] run scoreboard players set @s content_lock.temp1 2
execute at @e[tag=content_lock.quarry,limit=1,sort=nearest] if items block ~ ~ ~ container.4 *[enchantments={fortune:3}] unless items block ~ ~ ~ container.4 *[enchantments={silk_touch:1}] run scoreboard players set @s content_lock.temp1 3
execute at @e[tag=content_lock.quarry,limit=1,sort=nearest] if items block ~ ~ ~ container.4 *[enchantments={silk_touch:1}] run scoreboard players set @s content_lock.temp1 4

execute if score @s content_lock.temp1 matches 0 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe
execute if score @s content_lock.temp1 matches 1 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:1}]
execute if score @s content_lock.temp1 matches 2 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:2}]
execute if score @s content_lock.temp1 matches 3 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:3}]
execute if score @s content_lock.temp1 matches 4 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={silk_touch:1}]
tp @e[type=item,distance=..1] @e[tag=content_lock.quarry,limit=1,sort=nearest]

playsound minecraft:block.content_lock.quarry.break ambient @a ~ ~ ~ 0.5 0.5