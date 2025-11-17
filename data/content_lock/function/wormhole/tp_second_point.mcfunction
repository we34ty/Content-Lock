$execute positioned $(x) $(y) $(z) positioned over ocean_floor if block ~ ~-1 ~ #air run setblock ~ ~-1 ~ warped_nylium destroy
$execute positioned $(x) $(y) $(z) positioned over ocean_floor unless block ~ ~ ~ #air run setblock ~ ~ ~ air destroy
$execute positioned $(x) $(y) $(z) positioned over ocean_floor unless block ~ ~1 ~ #air run setblock ~ ~1 ~ air destroy
$execute positioned $(x) $(y) $(z) positioned over ocean_floor run tp @s ~ ~ ~ 0 0

tag @s remove content_lock.wormhole.yet_to_be_teleported