execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 220
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 200
execute if entity @s[scores={content_lock.attack_timer=200}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=200}] run rotate @s ~ 90
execute if entity @s[scores={content_lock.attack_timer=180..199}] run rotate @s ~ ~-9
execute if entity @s[scores={content_lock.attack_timer=180..200}] positioned ~ ~2 ~ run particle flame ^ ^ ^2 0.2 0.2 0.2 0.1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=180}] positioned ~ ~2 ~ run particle flame ^ ^ ^4 0.2 0.2 0.2 0.1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=180}] positioned ~ ~2 ~ run particle flame ^ ^ ^6 0.2 0.2 0.2 0.1 10 force @a

execute if entity @s[scores={content_lock.attack_timer=200}] run playsound entity.zombified_piglin.hurt hostile @a ~ ~ ~ 5 0.6
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[type=#minecraft:boss_can_damage,distance=..40] run summon area_effect_cloud ~ ~ ~ {Duration:100,Tags:["content_lock.zombified_piglin_princess.rain_fireballs.area"],Radius:0.0f}
execute if entity @s[scores={content_lock.attack_timer=100..160}] as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.area] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/rain_fireballs_area
execute if entity @s[scores={content_lock.attack_timer=20..160}] as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/rain_fireballs_projectile

execute if entity @s[scores={content_lock.attack_timer=180}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=180}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.zombified_piglin_princess.rain_fireballs