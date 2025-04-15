## Store inventory items in a new grave handle death effects.

tag @s add content_lock.remove_graves
execute as @e[type=marker,tag=multipack.grave_marker] if score @s multipack.graves = @r[tag=content_lock.remove_graves] multipack.graves at @s run function m_graves:graves/open_grave
tag @s remove content_lock.remove_graves

execute if score $tellCoords multipack.graves matches 1 run function m_graves:graves/tell_coords
function m_graves:graves/store/store_inventory
execute if data storage m_graves:grave_storage {Xp:0} unless data storage m_graves:grave_storage Items[0] run \ 
    return 0
execute if score $voidRecovery multipack.graves matches 0.. if predicate m_graves:in_void if dimension the_end run \
    return run execute summon minecraft:marker run function m_graves:graves/spawn_void_grave with storage m_graves:grave_storage
function m_graves:graves/spawn_grave
