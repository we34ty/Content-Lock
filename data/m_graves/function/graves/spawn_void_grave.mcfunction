## Iff a solid block is nearby, place a grave there
execute store result score &boolean multipack.temp run spreadplayers ~ ~ 0 8 false @s
execute if score $voidRecovery multipack.graves matches 16.. if score &boolean multipack.temp matches 0 store result score &boolean multipack.temp run \
    spreadplayers ~ ~ 0 16 false @s
execute if score $voidRecovery multipack.graves matches 32.. if score &boolean multipack.temp matches 0 store result score &boolean multipack.temp run \
    spreadplayers ~ ~ 0 32 false @s
execute if score $voidRecovery multipack.graves matches 64.. if score &boolean multipack.temp matches 0 store result score &boolean multipack.temp run \
    spreadplayers ~ ~ 0 64 false @s
$execute if score &boolean multipack.temp matches 0 store result score &boolean multipack.temp run \
    spreadplayers ~ ~ 0 $(voidRecovery) false @s
execute if score &boolean multipack.temp matches 1 at @s run function m_graves:graves/spawn_grave
kill @s
