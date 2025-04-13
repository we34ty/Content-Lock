rotate @s ~ 0

$execute positioned 0 0 0 positioned ^ ^ ^$(speed) run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.motion_saved_carrot"]}
$execute store result entity @s Motion[0] double 0.005 positioned 0 0 0 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.motion_saved_carrot,limit=1] Pos[0]
#execute store result entity @s Motion[1] double 0.005 positioned 0 0 0 positioned ^ ^ ^1 run data get entity @e[tag=content_lock.motion_saved_carrot,limit=1] Pos[1]
$execute store result entity @s Motion[2] double 0.005 positioned 0 0 0 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.motion_saved_carrot,limit=1] Pos[2]
