attribute @s max_health modifier remove content_lock.round_health
execute store result score @s content_lock.huhhealth1 run attribute @s max_health get 10000000
execute store result score @s content_lock.huhhealth2 run attribute @s max_health get

scoreboard players set @s content_lock.temp1 10000000
scoreboard players operation @s content_lock.huhhealth2 *= @s content_lock.temp1
scoreboard players operation @s content_lock.huhhealth1 -= @s content_lock.huhhealth2

scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s content_lock.huhhealth2 %= @s content_lock.temp1
#tellraw @s ["",{"text":"huhhealth1: ","color":"gold"},{"score":{"name":"@s","objective":"content_lock.huhhealth1"},"color":"yellow"}]
#tellraw @s ["",{"text":"huhhealth2: ","color":"gold"},{"score":{"name":"@s","objective":"content_lock.huhhealth2"},"color":"yellow"}]

execute if score @s content_lock.huhhealth2 matches 0 unless score @s content_lock.huhhealth1 matches 1.. run return 0
execute if score @s content_lock.huhhealth2 matches 1 if score @s content_lock.huhhealth1 matches 1.. run return 0

execute if score @s content_lock.huhhealth2 matches 0 if score @s content_lock.huhhealth1 matches 1.. run scoreboard players set @s content_lock.temp1 0
execute if score @s content_lock.huhhealth2 matches 1 unless score @s content_lock.huhhealth1 matches 1.. run scoreboard players set @s content_lock.temp1 1

execute store result score @s content_lock.huhhealth1 run attribute @s max_health get 100000
execute store result score @s content_lock.huhhealth2 run attribute @s max_health get

scoreboard players operation @s content_lock.huhhealth2 += @s content_lock.temp1
scoreboard players set @s content_lock.temp1 10000000
scoreboard players operation @s content_lock.huhhealth2 *= @s content_lock.temp1
scoreboard players operation @s content_lock.huhhealth2 /= @s content_lock.huhhealth1
scoreboard players add @s content_lock.huhhealth2 1

data merge storage content_lock:saved_stats {value:0}
execute store result storage content_lock:saved_stats value float 0.001 run scoreboard players get @s content_lock.huhhealth2
#tellraw @s ["",{"text":"Round Health: ","color":"gold"},{"score":{"name":"@s","objective":"content_lock.huhhealth2"},"color":"yellow"},{"text":"%","color":"gold"}]
function content_lock:player/passives/round_health_macro with storage content_lock:saved_stats
