tag @a remove content_lock.im_a_target
tag @a remove content_lock.im_a_vehicle
execute on vehicle run tag @s add content_lock.im_a_vehicle
execute on target run tag @s add content_lock.im_a_target

execute if entity @r[tag=content_lock.im_a_target] if entity @e[type=#boat,tag=content_lock.im_a_vehicle,limit=1,sort=nearest] run ride @s dismount

tag @a remove content_lock.im_a_target
tag @a remove content_lock.im_a_vehicle