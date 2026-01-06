execute if entity @n[type=wither,tag=!content_lock.boss] as @e[type=wither,tag=!content_lock.boss] run tag @s add content_lock.boss
execute if entity @e[tag=content_lock.boss,limit=1,sort=random] as @e[tag=content_lock.boss] at @s run function content_lock:mobs/bosses/tick
