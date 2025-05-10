tag @e remove content_lock.vehicle
execute on vehicle run tag @s add content_lock.vehicle
execute if entity @e[tag=content_lock.vehicle,tag=content_lock.tatsugeki.dolphin,limit=1,sort=nearest] run return 0

tag @s remove content_lock.tatsugeki.moving_forward
