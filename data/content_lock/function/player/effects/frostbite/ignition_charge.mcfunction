scoreboard players remove @s content_lock.frostbite.ignition_timer 1
execute if score @s content_lock.frostbite.ignition_timer matches 30 run playsound entity.blaze.ambient neutral @a ~ ~ ~ 1 0.8

particle flame ~ ~1 ~ 0.5 0.5 0.5 0.25 7 force @a 



execute unless score @s content_lock.frostbite.ignition_timer matches 1.. run function content_lock:player/effects/frostbite/ignition_charged