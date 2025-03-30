## Loop every second. Spawn their graves on player death. Open graves older than $graveDespawnTime seconds.
schedule function m_graves:graves/loop_1s 1s
execute as @a[scores={multipack.death=1..}] at @s positioned ~ ~0.125 ~ align y run function m_graves:graves/on_death
scoreboard players reset @a multipack.death

execute if score $graveDespawnTime multipack.graves matches 0.. as @e[type=marker,tag=multipack.grave_marker] at @s run \
    function m_graves:graves/increment_lifespan

