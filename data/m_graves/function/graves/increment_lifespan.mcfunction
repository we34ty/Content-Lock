## Increment the lifespan of this grave and open if it exceeds $graveDespawnTime.
scoreboard players add @s multipack.persist 1
execute if score @s multipack.persist > $graveDespawnTime multipack.graves run function m_graves:graves/open_grave