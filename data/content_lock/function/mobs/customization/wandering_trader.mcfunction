execute if entity @e[type=wandering_trader,distance=0.1..] run return run function content_lock:mobs/bosses/boss_despawn

attribute @s max_health modifier add content_lock.customized_content_lock 1 add_multiplied_base

effect give @s glowing 30 0 false
playsound entity.wandering_trader.reappeared voice @a ~ ~ ~ 4 1

tellraw @a[distance=..50] {"translate":"content_lock:notifications.wandering_trader.arrival","color":"green"}
