scoreboard players set @s content_lock.temp1 0
execute at @e[tag=content_lock.quarry,limit=1,sort=nearest] store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:fortune"
execute at @e[tag=content_lock.quarry,limit=1,sort=nearest] if items block ~ ~ ~ container.4 *[enchantments~[{enchantments:"silk_touch"}]] run scoreboard players set @s content_lock.temp1 -1

execute if score @s content_lock.temp1 matches 0 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe
execute if score @s content_lock.temp1 matches 1 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:1}]
execute if score @s content_lock.temp1 matches 2 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:2}]
execute if score @s content_lock.temp1 matches 3.. run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={fortune:3}]
execute if score @s content_lock.temp1 matches -1 run loot spawn ~ ~ ~ mine ~ ~ ~ netherite_pickaxe[enchantments={silk_touch:1}]
tp @e[type=item,distance=..1] @e[tag=content_lock.quarry,limit=1,sort=nearest]

playsound content_lock:block.quarry.break block @a ~ ~ ~ 1 0.5