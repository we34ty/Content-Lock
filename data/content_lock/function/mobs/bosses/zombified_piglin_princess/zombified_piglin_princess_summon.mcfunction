#kill @e[nbt={Item:{id:"minecraft:nether_star",Count:1b}},limit=1,sort=nearest]
data merge entity @s {DeathTime:20}
gamerule doMobLoot false 
kill @s
gamerule doMobLoot true 
tag @e[nbt={Item:{id:"minecraft:nether_star",Count:1b}},limit=1,sort=nearest] add transform_into_princess
execute as @e[tag=transform_into_princess] run data merge entity @s {PickupDelay:160}
execute as @e[tag=transform_into_princess] run data merge entity @s {NoGravity:1b}
