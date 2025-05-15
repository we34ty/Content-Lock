tag @e remove content_lock.yet_to_be_telported
tag @e remove content_lock.im_a_target
tag @s add content_lock.yet_to_be_telported
scoreboard players set @s content_lock.temp1 0
scoreboard players set @s content_lock.quickstep_dagger_charge 0
function content_lock:player/items/custom_weapons/quickstep_dagger/teleport_raycast

execute unless entity @e[tag=content_lock.im_a_target] run return 0

playsound entity.wither.shoot player @a ~ ~ ~ 0.2 1.4
particle dust{color:3552822,scale:1} ~ ~1 ~ 0.3 1 0.3 1 20 normal @a
effect give @s resistance 1 1 true
execute rotated as @e[tag=content_lock.im_a_target,limit=1,sort=nearest] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest] rotated ~ 0 positioned ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~
execute rotated as @e[tag=content_lock.im_a_target,limit=1,sort=nearest] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest] rotated ~ 0 positioned ^ ^ ^-1 run playsound entity.zombie.break_wooden_door player @a ~ ~ ~ 0.3 1.4

scoreboard players set @s content_lock.temp1 -30
item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add