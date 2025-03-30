execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 130
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120
execute if entity @s[scores={content_lock.attack_timer=119}] at @p run summon area_effect_cloud ~ ~ ~ {Duration:50,Tags:[content_lock.death_rider_teleport_point]}
execute if entity @s[scores={content_lock.attack_timer=..119}] at @e[tag=content_lock.death_rider_teleport_point,distance=0..40] run particle soul ~ ~1 ~ 0.2 1 0.2 0.1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=..119}] at @e[tag=content_lock.death_rider_teleport_point,distance=0..40] run playsound block.soul_sand.place hostile @a ~ ~ ~ 0.5 0.7
execute if entity @s[scores={content_lock.attack_timer=70}] run tp @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] @e[tag=content_lock.death_rider_teleport_point,limit=1,sort=nearest]
execute if entity @s[scores={content_lock.attack_timer=69..}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=69..}] run tp @s ~ ~ ~ ~15 0
execute if entity @s[scores={content_lock.attack_timer=69..}] positioned ~ ~1.5 ~ run particle soul_fire_flame ^ ^ ^1 0.2 0.2 0.2 0.05 4 force @a
execute if entity @s[scores={content_lock.attack_timer=69..}] positioned ~ ~1.5 ~ run particle soul_fire_flame ^ ^ ^2 0.2 0.2 0.2 0.05 4 force @a
execute if entity @s[scores={content_lock.attack_timer=69..}] positioned ~ ~1.5 ~ run particle soul_fire_flame ^ ^ ^3 0.2 0.2 0.2 0.05 4 force @a
execute if entity @s[scores={content_lock.attack_timer=69..}] as @a[distance=0..2] run damage @s 14 in_fire
execute if entity @s[scores={content_lock.attack_timer=69..}] positioned ^ ^ ^1 as @a[distance=0..2] run damage @s 12 in_fire
execute if entity @s[scores={content_lock.attack_timer=69..}] positioned ^ ^ ^2 as @a[distance=0..2] run damage @s 10 in_fire
execute if entity @s[scores={content_lock.attack_timer=40}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.teleport_and_spin