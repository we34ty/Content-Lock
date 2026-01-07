playsound item.firecharge.use neutral @a ~ ~ ~ 1 1
playsound entity.blaze.hurt neutral @a ~ ~ ~ 1 0.6
particle flame ~ ~ ~ 0 0 0 0.3 20 force @a
particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a

data merge storage content_lock:saved_stats {damage:1.0f,fire:1}
execute store result storage content_lock:saved_stats damage float 0.5 run data get entity @s Health
execute store result storage content_lock:saved_stats fire int 10 run data get entity @s Health
function content_lock:player/effects/heat_explode_macro with storage content_lock:saved_stats
scoreboard players set @s content_lock.heat 0
data merge entity @s {Fire:0}
tag @s remove content_lock.heat_will_explode
