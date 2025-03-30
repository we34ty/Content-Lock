## Drop all items in `m_graves:grave_storage`. Requires $(id), $(count), and $(components) correspond to 
## the nbt of the last item in `m_graves:grave_storage`.
$summon item ~ ~ ~ {Item:{id:"$(id)",count:$(count),components:$(components)}}
data remove storage m_graves:grave_storage Items[-1]

# Ensure next item in `m_graves:grave_storage` has a components value before recursing
execute unless data storage m_graves:grave_storage Items[-1].components run \
    data modify storage m_graves:grave_storage Items[-1].components set value "{}"
function m_graves:graves/drop_items with storage m_graves:grave_storage Items[-1]
