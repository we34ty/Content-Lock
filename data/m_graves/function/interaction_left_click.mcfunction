## Called by 'left_click_interaction' advancement
advancement revoke @s only m_graves:left_click_interaction
tag @s add multipack.interactor
execute if score $lockedGraves multipack.graves matches 0 as @e[distance=..10,type=interaction,tag=multipack.grave_interaction] \
    at @s on attacker if entity @s[tag=multipack.interactor] as @e[distance=..0.1,type=marker,tag=multipack.grave_marker] run \
    function m_graves:graves/open_grave
execute unless score $lockedGraves multipack.graves matches 0 as @e[distance=..10,type=interaction,tag=multipack.grave_interaction] \
    at @s on attacker if entity @s[tag=multipack.interactor] as @e[distance=..0.1,type=marker,tag=multipack.grave_marker] \
    if score @s multipack.graves = @p[tag=multipack.interactor] multipack.graves run function m_graves:graves/open_grave
tag @s remove multipack.interactor
