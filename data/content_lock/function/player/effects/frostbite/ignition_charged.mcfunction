tag @s add content_lock.ignited
playsound item.firecharge.use neutral @a ~ ~ ~ 1 1
playsound entity.blaze.hurt neutral @a ~ ~ ~ 1 0.6
particle flame ~ ~ ~ 0 0 0 0.3 20 force @a
particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a

data merge storage content_lock:saved_stats {damage:1.0f}
execute store result score @s content_lock.temp1 run attribute @s max_health get 200
scoreboard players add @s content_lock.temp1 10000
execute store result storage content_lock:saved_stats damage float 0.001 run scoreboard players get @s content_lock.temp1

tag @e remove content_lock.ignited_attacker
execute on attacker run tag @s add content_lock.ignited_attacker
execute as @e[type=!#entities,distance=..3.5,tag=!content_lock.ignited_attacker] run function content_lock:player/effects/frostbite/ignite_macro with storage content_lock:saved_stats