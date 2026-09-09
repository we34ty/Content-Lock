tag @e remove content_lock.im_a_target
execute at @s facing entity @n[tag=content_lock.enchantment.bonus.armor.iron.knockback_immune] feet rotated ~180 -30 positioned ^ ^ ^0.8 run summon marker ~ ~ ~ {Tags:["content_lock.im_a_target"]}

execute at @s store result score @s content_lock.temp1 run data get entity @n[tag=content_lock.im_a_target] Pos[0] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[0] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s content_lock.temp1

execute at @s store result score @s content_lock.temp1 run data get entity @n[tag=content_lock.im_a_target] Pos[1] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[1] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
#scoreboard players add @s content_lock.temp1 100
execute store result entity @s Motion[1] double 0.01 run scoreboard players get @s content_lock.temp1

execute at @s store result score @s content_lock.temp1 run data get entity @n[tag=content_lock.im_a_target] Pos[2] 100
execute store result score @s content_lock.temp2 run data get entity @s Pos[2] 100
scoreboard players operation @s content_lock.temp1 -= @s content_lock.temp2
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s content_lock.temp1

kill @n[tag=content_lock.im_a_target]