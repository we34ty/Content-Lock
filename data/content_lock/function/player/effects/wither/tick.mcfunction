scoreboard players remove @s content_lock.wither_stacks 1200
execute if score @s content_lock.wither_stacks matches ..0 run function content_lock:player/effects/wither/end

data merge storage content_lock:saved_stats {damage:0.0f}
execute unless entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.05 run attribute @s max_health get
execute if entity @s[tag=content_lock.boss] store result storage content_lock:saved_stats damage float 0.007 run attribute @s max_health get
function content_lock:player/effects/wither/damage with storage content_lock:saved_stats