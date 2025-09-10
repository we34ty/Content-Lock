#execute unless items entity @s weapon.mainhand iron_shovel[custom_data~{"content_lock.guardian_shovel":true}] run return 0


tag @s add content_lock.charging_shovel_atm
execute if entity @s[nbt={OnGround:1b}] run return 0

tag @s add content_lock.charging_shovel
execute unless score @s content_lock.shovel_charge matches 11.. run scoreboard players add @s content_lock.shovel_charge 1
execute unless score @s content_lock.shovel_charge matches 10.. run return 0

tag @s add content_lock.charged_shovel
execute if score @s content_lock.shovel_charge matches 10 run playsound block.note_block.chime player @s ~ ~ ~ 1 0.7
