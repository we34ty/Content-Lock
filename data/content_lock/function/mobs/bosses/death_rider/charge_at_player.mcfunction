execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 180
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 150
execute if entity @s[scores={content_lock.attack_timer=149}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=1..149}] positioned ~ ~1.3 ~ rotated ~ 0 run particle soul ^ ^ ^0.3 0.1 0.1 0.1 0.01 4 force @a
execute if entity @s[scores={content_lock.attack_timer=1..149}] run playsound entity.zombie.infect hostile @a ~ ~ ~ 2 1.3
execute if entity @s[scores={content_lock.attack_timer=149}] at @a[distance=0..40] run summon area_effect_cloud ~ ~ ~ {Duration:80,Tags:[content_lock.death_rider_projectile_point]}
execute if entity @s[scores={content_lock.attack_timer=119}] at @a[distance=0..40] run summon area_effect_cloud ~ ~ ~ {Duration:50,Tags:[content_lock.death_rider_projectile_point]}
execute if entity @s[scores={content_lock.attack_timer=89}] at @a[distance=0..40] run summon area_effect_cloud ~ ~ ~ {Duration:20,Tags:[content_lock.death_rider_projectile_point]}
execute if entity @s[scores={content_lock.attack_timer=1..149}] at @e[tag=content_lock.death_rider_projectile_point,distance=0..40] run particle soul_fire_flame ~ ~1 ~ 0.2 0.2 0.2 0.05 5 force @a 
execute if entity @s[scores={content_lock.attack_timer=70}] run function content_lock:mobs/bosses/death_rider/raycast_at_player
execute if entity @s[scores={content_lock.attack_timer=69}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=69}] run tag @s remove content_lock.charge_at_player