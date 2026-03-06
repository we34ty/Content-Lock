execute if block ~ ~-1 ~ #air run setblock ~ ~-1 ~ warped_nylium destroy
execute unless block ~ ~ ~ #air run setblock ~ ~ ~ air destroy
execute unless block ~ ~1 ~ #air run setblock ~ ~1 ~ air destroy
tag @s add content_lock.wormhole.checked_for_blocks
