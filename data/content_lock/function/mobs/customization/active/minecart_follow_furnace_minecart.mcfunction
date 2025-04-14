tag @a remove content_lock.im_a_passanger
execute on passengers run tag @s add content_lock.im_a_passanger

#execute store result score @s content_lock.temp1 run data get entity @s Motion[2]
execute if entity @r[tag=content_lock.im_a_passanger] unless score @s content_lock.temp1 matches 1.. store result entity @s Motion[0] double 0.8 run data get entity @e[type=furnace_minecart,distance=..4,limit=1,sort=nearest] PushX
execute unless entity @r[tag=content_lock.im_a_passanger] unless score @s content_lock.temp1 matches 1.. store result entity @s Motion[0] double 0.42 run data get entity @e[type=furnace_minecart,distance=..4,limit=1,sort=nearest] PushX

#execute store result score @s content_lock.temp1 run data get entity @s Motion[0]
execute if entity @r[tag=content_lock.im_a_passanger] unless score @s content_lock.temp1 matches 1.. store result entity @s Motion[2] double 0.8 run data get entity @e[type=furnace_minecart,distance=..4,limit=1,sort=nearest] PushZ
execute unless entity @r[tag=content_lock.im_a_passanger] unless score @s content_lock.temp1 matches 1.. store result entity @s Motion[2] double 0.42 run data get entity @e[type=furnace_minecart,distance=..4,limit=1,sort=nearest] PushZ


