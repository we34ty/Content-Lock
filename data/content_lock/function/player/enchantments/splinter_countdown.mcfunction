scoreboard players remove @s content_lock.splinter_counter 1

execute if score @s content_lock.splinter_counter matches 1.. run return 0
tag @s remove content_lock.splintered

data merge storage content_lock:saved_stats {damage:1.0f}
execute unless entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 200
execute if entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 20
execute at @s run function content_lock:player/enchantments/splinter_activate with storage content_lock:saved_stats