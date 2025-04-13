title @s clear
execute if score @s content_lock.bleed_stacks matches 120.. run tag @s add content_lock.bleed_active

execute if score @s content_lock.bleed_stacks matches 1.. run scoreboard players remove @s content_lock.bleed_stacks 4
execute if score @s content_lock.frostbite_stacks matches 1.. run scoreboard players remove @s content_lock.frostbite_stacks 1
execute if score @s content_lock.frostbite_stacks matches ..-1 run scoreboard players add @s content_lock.frostbite_stacks 1
execute if score @s content_lock.corruption_meter matches 1.. run scoreboard players remove @s content_lock.corruption_meter 1

execute if score @s content_lock.bleed_stacks matches 121.. run scoreboard players set @s content_lock.bleed_stacks 120
#execute if score @s content_lock.frostbite_stacks matches 1.. run scoreboard players remove @s content_lock.frostbite_stacks 1
execute if score @s content_lock.corruption_meter matches 241.. run scoreboard players set @s content_lock.corruption_meter 240