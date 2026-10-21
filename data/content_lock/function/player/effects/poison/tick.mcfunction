scoreboard players remove @s content_lock.poison_stacks 40
scoreboard players remove @s content_lock.poison_timer 1
execute if score @s content_lock.poison_stacks matches ..0 run function content_lock:player/effects/poison/end

execute if score @s content_lock.poison_timer matches 1.. run return 0

scoreboard players set @s content_lock.poison_timer 10
data merge storage content_lock:saved_stats {damage:0.0f}
execute unless entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.0001 run data get entity @s Health 1000
execute if entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.00002 run data get entity @s Health 1000
function content_lock:player/effects/poison/damage with storage content_lock:saved_stats