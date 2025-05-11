## Spawn a grave with the contents of 'm_graves:grave_storage'
# Place grave marker and interaction entities

summon interaction ~ ~ ~ {Tags:["multipack.grave_interaction"],width:1.3f,height:1f}
summon marker ~ ~ ~ {Tags:["multipack.grave_marker"]}
data modify entity @n[distance=..0.1,type=marker,tag=multipack.grave_marker] data set from storage m_graves:grave_storage
execute unless score @s multipack.graves matches -2147483648..2147483647 run scoreboard players add $graveID multipack.persist 1
execute unless score @s multipack.graves matches -2147483648..2147483647 run scoreboard players operation @s multipack.graves = $graveID multipack.persist
scoreboard players operation @n[distance=..0.1,type=marker,tag=multipack.grave_marker] multipack.graves = @s multipack.graves

# Display "R.I.P" and the name of the dead player. If there are multiple dead players, skip name
summon block_display ~ ~ ~ {Tags:["multipack.grave_display"],block_state:{Name:"soul_lantern"},transformation:{translation:[-0.95f,0f,-0.75f],left_rotation:[0f,0f,0f,1f],scale:[1.5f,1.0f,1.5f],right_rotation:[0f,0f,0f,1f]}}
summon block_display ~ ~ ~ {Tags:["multipack.grave_display"],block_state:{Name:"tinted_glass"},transformation:{translation:[-0.577f,0.033f,-0.376f],left_rotation:[0f,0f,0.125f,1f],scale:[0.125f,1f,0.74f],right_rotation:[0f,0f,0f,1f]}}
execute store result score &playersDead multipack.temp run execute if entity @a[scores={multipack.death=1..}]
execute if score &playersDead multipack.temp matches 1 run summon text_display ~ ~ ~ {alignment:"center",Tags:["multipack.grave_display"],transformation:{left_rotation:[0f,0f,0.125f,1f],right_rotation:[0f,1f,0f,1f],translation:[-0.58f,0.7f,0f],scale:[0.4f,0.4f,0.4f]},text:'{"selector":"@p[scores={multipack.death=1..}]"}',background:0}
#summon text_display ~ ~ ~ {alignment:"center",Tags:["multipack.grave_display"],transformation:{left_rotation:[0f,0f,0.125f,1f],right_rotation:[0f,1f,0f,1f],translation:[-0.62f,0.74f,0f],scale:[0.74f,0.74f,0.74f]},text:'{"text":"R.I.P"}',background:0}
scoreboard players reset &playersDead multipack.temp

forceload add ~-1 ~-1 ~1 ~1
#summon zombie ~ ~ ~ {PersistenceRequired:true,active_effects:[{id:fire_resistance,ambient:true,duration:-1}],attributes:[{id:spawn_reinforcements,base:0.5f},{id:"armor",base:10f},{id:"armor_toughness",base:10f},{id:"follow_range",base:100f}]}