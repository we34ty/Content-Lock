execute unless entity @s[nbt={HurtTime:0s}] run return run scoreboard players add @s content_lock.bleed_stacks 1
tag @s remove content_lock.bleed_active
tellraw @s [{"translate": "content_lock:effect.bleed.activated","color":"dark_red"}]
data merge storage content_lock:saved_stats {damage:1.0f}
execute unless entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 350
execute if entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.001 run attribute @s max_health get 50
execute at @s run function content_lock:player/effects/bleed_damage with storage content_lock:saved_stats
scoreboard players set @s content_lock.bleed_stacks 0