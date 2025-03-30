execute if entity @s[tag=!content_lock.charging_shovel_atm,tag=content_lock.charged_shovel,nbt={OnGround:1b}] run function content_lock:player/items/charge_shovel_slam_arguments
execute if entity @s[tag=!content_lock.charging_shovel] run scoreboard players remove @s content_lock.shovel_charge 2
execute if entity @s[tag=content_lock.charging_shovel] run tag @s remove content_lock.charging_shovel
execute if entity @s[tag=content_lock.charging_shovel_atm] run tag @s remove content_lock.charging_shovel_atm
execute if score @s content_lock.shovel_charge matches 0 run tag @s remove content_lock.charged_shovel
