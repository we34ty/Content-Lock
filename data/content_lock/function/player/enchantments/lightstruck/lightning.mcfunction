execute if score @s content_lock.enchantment.lightstruck matches ..0 run playsound content_lock:item.enchantment.lightstruck.end player @a ~ ~ ~ 1 1
execute if score @s content_lock.enchantment.lightstruck matches ..0 run particle electric_spark ~ ~ ~ 0.5 0.5 0.5 1 30 normal @a
execute if score @s content_lock.enchantment.lightstruck matches ..0 run kill @s

scoreboard players add @s content_lock.timer1 1
scoreboard players add @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 100.. run playsound content_lock:item.enchantment.lightstruck.end player @a ~ ~ ~ 1 1
execute if score @s content_lock.temp1 matches 100.. run particle electric_spark ~ ~ ~ 0.5 0.5 0.5 1 30 normal @a
execute if score @s content_lock.temp1 matches 100.. run kill @s

particle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.3 5 force @a

execute unless score @s content_lock.timer1 matches 21.. run return 0

tag @e remove content_lock.enchantment.lightstruck.to_be_damaged
execute as @n[type=!#entities,tag=!content_lock.enchantment.lightstruck.damaged,type=!player,distance=..8,nbt={HurtTime:0s}] run tag @s add content_lock.enchantment.lightstruck.to_be_damaged

execute unless entity @e[tag=content_lock.enchantment.lightstruck.to_be_damaged,distance=..8] run scoreboard players set @s content_lock.timer1 0
execute unless entity @e[tag=content_lock.enchantment.lightstruck.to_be_damaged,distance=..8] run return run tag @e remove content_lock.enchantment.lightstruck.damaged

scoreboard players set @s content_lock.temp1 0

execute if score @s content_lock.temp3 matches ..1 run scoreboard players remove @s content_lock.enchantment.lightstruck 6
execute if score @s content_lock.temp3 matches 2 run scoreboard players remove @s content_lock.enchantment.lightstruck 5
execute if score @s content_lock.temp3 matches 3 run scoreboard players remove @s content_lock.enchantment.lightstruck 4
execute if score @s content_lock.temp3 matches 4.. run scoreboard players remove @s content_lock.enchantment.lightstruck 3

#tellraw @a {score:{name:"@s",objective:"content_lock.enchantment.lightstruck"}}
scoreboard players set @s content_lock.timer2 0
playsound content_lock:item.enchantment.lightstruck.attack player @a ~ ~ ~ 1 1
function content_lock:player/enchantments/lightstruck/lightning_ray