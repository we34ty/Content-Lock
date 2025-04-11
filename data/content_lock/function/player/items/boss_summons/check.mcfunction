scoreboard players set @s content_lock.temp1 0
execute if entity @e[tag=content_lock.boss] run scoreboard players set @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 1 run title @s times 2 8 3
execute if score @s content_lock.temp1 matches 1 run title @s actionbar {"translate": "content_lock:notifications.boss_already_exists","color": "dark_red"}
#execute if score @s content_lock.temp1 matches 1 run playsound minecraft:block.stone.break voice @s ~ ~ ~ 0.5 0.1
execute if score @s content_lock.temp1 matches 1 run return 0

execute if items entity @s weapon.mainhand minecraft:pink_dye[custom_data={"content_lock.enchanted_witch_summon":true}] run function content_lock:mobs/bosses/enchanted_witch/enchanted_witch_summon
execute if items entity @s weapon.mainhand minecraft:pink_dye[custom_data={"content_lock.death_rider_summon":true}] run function content_lock:mobs/bosses/death_rider/death_rider_spawn
