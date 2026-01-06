## Drop all items from this grave then remove this grave.
# Summon all items and experience in this grave
data modify storage m_graves:grave_storage Items set from entity @s data.Items
data modify storage m_graves:grave_storage Xp set from entity @s data.Xp
execute unless data storage m_graves:grave_storage Items[-1].components run \
    data modify storage m_graves:grave_storage Items[-1].components set value "{}"
function m_graves:graves/drop_items with storage m_graves:grave_storage Items[-1]
execute unless data storage m_graves:grave_storage {Xp:0} summon experience_orb run \
    data modify entity @s Value set from storage m_graves:grave_storage Xp

# Clear grave
playsound block.gravel.break block @a
particle block{block_state:"coarse_dirt"} ~ ~.125 ~ 0.75 0.5 0.5 2 10
kill @n[distance=..0.1,type=interaction,tag=multipack.grave_interaction]
kill @e[distance=..0.1,type=block_display,tag=multipack.grave_display,limit=2,sort=nearest]
kill @e[distance=..0.1,type=text_display,tag=multipack.grave_display,limit=2,sort=nearest]
kill @e[distance=..0.1,type=marker,tag=multipack.grave_marker,limit=1,sort=nearest]
kill @s

forceload remove ~-1 ~-1 ~1 ~1