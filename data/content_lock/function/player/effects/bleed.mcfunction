tag @s remove content_lock.bleed_active
title @s subtitle {"translate": "content_lock:effect.bleed.activated","bold":true,"color":"dark_red"}
title @s title {"text": ""}
data merge storage content_lock:saved_stats {damage:1.0f}
execute unless entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 350
execute if entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 5
execute at @s run function content_lock:player/effects/bleed_damage with storage content_lock:saved_stats
scoreboard players set @s content_lock.bleed_stacks 0