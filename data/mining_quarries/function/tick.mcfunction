#execute as @a[advancements={minecraft:recipes/brewing/cauldron=true,minecraft:recipes/redstone/hopper=true,minecraft:recipes/redstone/dropper=true}] run recipe give @s mining_quarries:quarry

#execute as @a[scores={content_lock.quarry_place=1..}] at @s run function mining_quarries:placed
#scoreboard players set @a content_lock.quarry_place 0

schedule function mining_quarries:tick 2t replace