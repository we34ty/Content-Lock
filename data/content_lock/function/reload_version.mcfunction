##pretty important
##calculates the version of the content lock and sends it to players in a tellraw message
scoreboard players set L content_lock.temp1 10000
scoreboard players set L content_lock.temp2 100
scoreboard players operation L content_lock.huhhealth1 = L content_lock.content_lock_version
scoreboard players operation L content_lock.huhhealth2 = L content_lock.content_lock_version
scoreboard players operation L content_lock.temp3 = L content_lock.content_lock_version
scoreboard players operation L content_lock.huhhealth1 /= L content_lock.temp1
scoreboard players operation L content_lock.huhhealth1 *= L content_lock.temp1
scoreboard players operation L content_lock.huhhealth2 -= L content_lock.huhhealth1
scoreboard players operation L content_lock.huhhealth2 /= L content_lock.temp2
scoreboard players operation L content_lock.huhhealth2 *= L content_lock.temp2
scoreboard players operation L content_lock.temp3 -= L content_lock.huhhealth1
scoreboard players operation L content_lock.temp3 -= L content_lock.huhhealth2
scoreboard players operation L content_lock.huhhealth1 /= L content_lock.temp1
scoreboard players operation L content_lock.huhhealth2 /= L content_lock.temp2

##all cases with 0's if they should be displayed or not
execute unless score L content_lock.temp3 matches ..9 run tellraw @a ["",{"text":"Content Lock ","color":"green"},{"score":{"name":"L","objective":"content_lock.huhhealth1"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"L","objective":"content_lock.huhhealth2"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"L","objective":"content_lock.temp3"},"color":"green"},{"translate":"content_lock:notifications.reload_v0","color":"green",fallback:" Reloaded - Resource pack invalid or missing"}]
execute if score L content_lock.temp3 matches 1..9 run tellraw @a ["",{"text":"Content Lock ","color":"green"},{"score":{"name":"L","objective":"content_lock.huhhealth1"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"L","objective":"content_lock.huhhealth2"},"color":"green"},{"text":".0","color":"green"},{"score":{"name":"L","objective":"content_lock.temp3"},"color":"green"},{"translate":"content_lock:notifications.reload_v0","color":"green",fallback:" Reloaded - Resource pack invalid or missing"}]
execute if score L content_lock.temp3 matches 0 run tellraw @a ["",{"text":"Content Lock ","color":"green"},{"score":{"name":"L","objective":"content_lock.huhhealth1"},"color":"green"},{"text":".","color":"green"},{"score":{"name":"L","objective":"content_lock.huhhealth2"},"color":"green"},{"translate":"content_lock:notifications.reload_v0","color":"green",fallback:" Reloaded - Resource pack invalid or missing"}]

