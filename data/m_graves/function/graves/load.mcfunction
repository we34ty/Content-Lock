## Players leave graves containing their items and xp on death.
schedule clear m_graves:graves/loop_1s
execute if score $playerGraves multipack.constants matches 0 run return 0

scoreboard objectives add multipack.death deathCount
scoreboard objectives add multipack.graves dummy
scoreboard players reset @a multipack.death
advancement revoke @a only m_graves:left_click_interaction
advancement revoke @a only m_graves:right_click_interaction
gamerule keepInventory true
execute in minecraft:overworld run gamerule keepInventory true
execute in minecraft:the_nether run gamerule keepInventory true
execute in minecraft:the_end run gamerule keepInventory true
gamerule doImmediateRespawn false

execute unless score $playerGraves multipack.graves matches 0..1 run scoreboard players set $playerGraves multipack.graves 1
execute unless score $graveDespawnTime multipack.graves matches 0.. run scoreboard players set $graveDespawnTime multipack.graves -1
execute unless score $tellCoords multipack.graves matches 0..1 run scoreboard players set $tellCoords multipack.graves 0
execute unless score $lockedGraves multipack.graves matches 0..1 run scoreboard players set $lockedGraves multipack.graves 1
execute unless score $voidRecovery multipack.graves matches 0.. run scoreboard players set $voidRecovery multipack.graves 100
execute unless score $lockedGraves multipack.graves matches 0..1 run scoreboard players set $lockedGraves multipack.graves 1
execute unless score $keepXp multipack.graves matches 0..1 run scoreboard players set $keepXp multipack.graves 0
execute unless score $keepHotbar multipack.graves matches 0..1 run scoreboard players set $keepHotbar multipack.graves 1
execute unless score $keepArmor multipack.graves matches 0..1 run scoreboard players set $keepArmor multipack.graves 1
execute unless score $keepItems multipack.graves matches 0..1 run scoreboard players set $keepItems multipack.graves 1
execute unless score $loseItems multipack.graves matches 0..1 run scoreboard players set $loseItems multipack.graves 0

execute store result storage m_graves:grave_storage voidRecovery int 1 run scoreboard players get $voidRecovery multipack.graves

function m_graves:graves/loop_1s
