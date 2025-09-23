$execute positioned $(x) $(y) $(z) if block ~ ~-1 ~ #air run setblock ~ ~-1 ~ warped_nylium
$execute positioned $(x) $(y) $(z) unless block ~ ~ ~ #air run setblock ~ ~ ~ air
$execute positioned $(x) $(y) $(z) unless block ~ ~1 ~ #air run setblock ~ ~1 ~ air
$execute positioned $(x) $(y) $(z) run tp @s ~ ~ ~ 0 0
tag @s remove content_lock.wormhole.yet_to_be_teleported