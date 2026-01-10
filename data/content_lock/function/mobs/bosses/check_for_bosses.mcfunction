execute if entity @s[type=wither,tag=!content_lock.boss] run tag @s add content_lock.boss
execute if entity @s[tag=content_lock.boss] at @s run function content_lock:mobs/bosses/tick
