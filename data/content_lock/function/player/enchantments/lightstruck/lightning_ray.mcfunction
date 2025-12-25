scoreboard players add @s content_lock.timer2 1

particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0.6 3 force @a

execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @n[tag=content_lock.enchantment.lightstruck.to_be_damaged,dx=1,dz=1,dy=1] run tp @s ~ ~ ~
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @n[tag=content_lock.enchantment.lightstruck.to_be_damaged,dx=1,dz=1,dy=1] at @n[tag=content_lock.enchantment.lightstruck.to_be_damaged,dx=1,dz=1,dy=1] run return run function content_lock:player/enchantments/lightstruck/lightning_ray_hit

execute if score @s content_lock.timer2 matches 9 run tp @s ~ ~ ~
execute if score @s content_lock.timer2 matches ..8 facing entity @n[tag=content_lock.enchantment.lightstruck.to_be_damaged] eyes positioned ^ ^ ^1 run function content_lock:player/enchantments/lightstruck/lightning_ray