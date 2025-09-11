execute if data block ~ ~ ~ Items[{Slot:4b,id:"minecraft:golden_pickaxe"}].components."minecraft:enchantments"."minecraft:silk_touch" run return run loot spawn ~ ~ ~ loot mining_quarries:golden_silk
execute if data block ~ ~ ~ Items[{Slot:4b,id:"minecraft:netherite_pickaxe"}].components."minecraft:enchantments"."minecraft:silk_touch" run return run loot spawn ~ ~ ~ loot mining_quarries:netherite_silk
execute if data block ~ ~ ~ Items[{Slot:4b,id:"minecraft:diamond_pickaxe"}].components."minecraft:enchantments"."minecraft:silk_touch" run return run loot spawn ~ ~ ~ loot mining_quarries:diamond_silk
execute if data block ~ ~ ~ Items[{Slot:4b,id:"minecraft:iron_pickaxe"}].components."minecraft:enchantments"."minecraft:silk_touch" run return run loot spawn ~ ~ ~ loot mining_quarries:iron_silk
execute if data block ~ ~ ~ Items[{Slot:4b,id:"minecraft:stone_pickaxe"}].components."minecraft:enchantments"."minecraft:silk_touch" run return run loot spawn ~ ~ ~ loot mining_quarries:stone_silk
execute if data block ~ ~ ~ Items[{Slot:4b,id:"minecraft:wooden_pickaxe"}].components."minecraft:enchantments"."minecraft:silk_touch" run return run loot spawn ~ ~ ~ loot mining_quarries:wooden_silk

execute if items block ~ ~ ~ container.4 minecraft:golden_pickaxe run return run loot spawn ~ ~ ~ loot mining_quarries:golden
execute if items block ~ ~ ~ container.4 minecraft:netherite_pickaxe run return run loot spawn ~ ~ ~ loot mining_quarries:netherite
execute if items block ~ ~ ~ container.4 minecraft:diamond_pickaxe run return run loot spawn ~ ~ ~ loot mining_quarries:diamond
execute if items block ~ ~ ~ container.4 minecraft:iron_pickaxe run return run loot spawn ~ ~ ~ loot mining_quarries:iron
execute if items block ~ ~ ~ container.4 minecraft:stone_pickaxe run return run loot spawn ~ ~ ~ loot mining_quarries:stone
execute if items block ~ ~ ~ container.4 minecraft:wooden_pickaxe run return run loot spawn ~ ~ ~ loot mining_quarries:wooden