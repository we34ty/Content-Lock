execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 110
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 80
execute if entity @s[scores={content_lock.attack_timer=80}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=80}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=80}] run attribute @s fall_damage_multiplier modifier add content_lock.no_fall -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.wither.ambient hostile @a ~ ~ ~ 1 2
execute if entity @s[scores={content_lock.attack_timer=60..80}] run particle flame ~ ~ ~ 1 1 1 0.1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=60}] run data merge entity @s {Motion:[0.0d,0.8d,0.0d]}
execute if entity @s[scores={content_lock.attack_timer=50..60}] positioned ~-4 ~-2 ~-4 as @e[type=#boss_can_damage,dx=8,dy=8,dz=8,type=!player] run data merge entity @s {Motion:[0.0d,0.6d,0.0d]}
execute if entity @s[scores={content_lock.attack_timer=50..60}] run scoreboard players set $x player_motion.api.launch 0
execute if entity @s[scores={content_lock.attack_timer=50..60}] run scoreboard players set $y player_motion.api.launch 3000
execute if entity @s[scores={content_lock.attack_timer=50..60}] run scoreboard players set $z player_motion.api.launch 0
execute if entity @s[scores={content_lock.attack_timer=50..60}] positioned ~-4 ~-2 ~-4 as @e[type=player,dx=8,dy=8,dz=8] run function player_motion:api/launch_xyz
execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.firework_rocket.launch hostile @a ~ ~ ~ 1 2
execute if entity @s[scores={content_lock.attack_timer=50..60}] positioned ~ ~2 ~ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:4,distance:8,damage:3,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=50..60}] positioned ~ ~2 ~ positioned ^ ^ ^1 run particle flame ~ ~ ~ 0.5 2 0.5 0.1 20 normal @a

execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s fall_damage_multiplier modifier remove content_lock.no_fall
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.zombified_piglin_princess.volcanic_viper