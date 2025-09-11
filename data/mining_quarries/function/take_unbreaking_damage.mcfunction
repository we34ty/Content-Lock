execute if data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:mending" run return 1
execute unless data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:unbreaking" run return run function mining_quarries:update_damage

execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":1}}}]} unless predicate mining_quarries:unbreaking_1 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":2}}}]} unless predicate mining_quarries:unbreaking_2 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":3}}}]} unless predicate mining_quarries:unbreaking_3 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":4}}}]} unless predicate mining_quarries:unbreaking_4 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":5}}}]} unless predicate mining_quarries:unbreaking_5 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":6}}}]} unless predicate mining_quarries:unbreaking_6 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":7}}}]} unless predicate mining_quarries:unbreaking_7 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":8}}}]} unless predicate mining_quarries:unbreaking_8 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:enchantments":{"minecraft:unbreaking":9}}}]} unless predicate mining_quarries:unbreaking_9 run return run function mining_quarries:update_damage
execute if data block ~ ~ ~ Items[{Slot:4b}].components."minecraft:enchantments"."minecraft:unbreaking" unless predicate mining_quarries:unbreaking_10 run return run function mining_quarries:update_damage