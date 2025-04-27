execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 220
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 200
execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

#execute if entity @s[scores={content_lock.attack_timer=100..200}] run particle flame ~ ~3 ~ 0.2 0.2 0.2 0.1 10 force @a
#execute if entity @s[scores={content_lock.attack_timer=200}] run playsound item.firecharge.use hostile @a ~ ~ ~ 5 1
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[type=#minecraft:boss_can_damage,distance=..40] run summon area_effect_cloud ~ ~ ~ {Duration:100,Tags:["content_lock.zombified_piglin_princess.rain_fireballs.area"]}
execute if entity @s[scores={content_lock.attack_timer=100..160}] as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.area] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/rain_fireballs_area
execute if entity @s[scores={content_lock.attack_timer=20..160}] as @e[tag=content_lock.zombified_piglin_princess.rain_fireballs.projectile] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/rain_fireballs_projectile

execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.zombified_piglin_princess.rain_fireballs