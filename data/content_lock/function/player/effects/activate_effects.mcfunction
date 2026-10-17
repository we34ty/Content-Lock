title @s clear
execute if score @s content_lock.bleed_stacks matches 12000.. run tag @s add content_lock.bleed_active
execute if score @s[tag=content_lock.frostbite_active] content_lock.frostbite_stacks matches ..0 run function content_lock:player/effects/frostbite/remove

execute if score @s content_lock.bleed_stacks matches 1.. run scoreboard players remove @s content_lock.bleed_stacks 200

execute if score @s content_lock.frostbite_stacks matches 1.. if entity @s[tag=content_lock.frostbite_active] run scoreboard players remove @s content_lock.frostbite_stacks 750
execute if score @s content_lock.frostbite_stacks matches 100.. unless entity @s[tag=content_lock.frostbite_active] run scoreboard players remove @s content_lock.frostbite_stacks 100
execute if score @s content_lock.frostbite_stacks matches ..-100 unless entity @s[tag=content_lock.frostbite_active] run scoreboard players add @s content_lock.frostbite_stacks 100
execute if score @s content_lock.frostbite_stacks matches -99..99 unless entity @s[tag=content_lock.frostbite_active] run scoreboard players set @s content_lock.frostbite_stacks 0

execute unless entity @s[tag=content_lock.corrupted] if score @s content_lock.corruption_meter matches 1.. run scoreboard players remove @s content_lock.corruption_meter 100
execute if entity @s[tag=content_lock.corrupted] at @s run function content_lock:player/effects/corruption/tick


execute if score @s content_lock.bleed_stacks matches 12001.. run scoreboard players set @s content_lock.bleed_stacks 12000
execute if score @s content_lock.bleed_stacks matches ..-1 run scoreboard players set @s content_lock.bleed_stacks 0
execute if score @s content_lock.corruption_meter matches ..-1 run scoreboard players set @s content_lock.corruption_meter 0
#execute if score @s content_lock.frostbite_stacks matches 1.. run scoreboard players remove @s content_lock.frostbite_stacks 1
