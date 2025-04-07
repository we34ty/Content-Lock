execute if entity @p[distance=0..14] at @p if predicate content_lock:random if predicate content_lock:random run summon area_effect_cloud ~ ~ ~ {Duration:41,Tags:[to_be_struck_by_warden_lightning]}

execute if entity @e[tag=to_be_struck_by_warden_lightning,scores={attack_timer=1}] at @e[tag=to_be_struck_by_warden_lightning,scores={attack_timer=1}] run playsound minecraft:entity.lightning_bolt.thunder hostile @p ~ ~ ~ 1 2
execute if entity @e[tag=to_be_struck_by_warden_lightning] as @e[tag=to_be_struck_by_warden_lightning] run scoreboard players add @s attack_timer 1
execute if entity @e[tag=to_be_struck_by_warden_lightning] at @e[tag=to_be_struck_by_warden_lightning] run particle electric_spark ~ ~0.2 ~ 0.5 0 0.5 0 4 force @a
execute if entity @e[tag=to_be_struck_by_warden_lightning,scores={attack_timer=40..}] at @e[tag=to_be_struck_by_warden_lightning,scores={attack_timer=40..}] run summon lightning_bolt

execute if entity @p[distance=0..14] if predicate content_lock:random if predicate content_lock:random run summon area_effect_cloud ^ ^ ^1 {Duration:20,Tags:[blaze_warden_fire_wall]}
execute if entity @e[tag=blaze_warden_fire_wall,tag=!blaze_warden_fire_wall_faced] as @e[tag=blaze_warden_fire_wall,tag=!blaze_warden_fire_wall_faced] at @s facing entity @p eyes rotated ~ 0 run tp @s ~ ~ ~ ~ ~
execute if entity @e[tag=blaze_warden_fire_wall,tag=!blaze_warden_fire_wall_faced] as @e[tag=blaze_warden_fire_wall,tag=!blaze_warden_fire_wall_faced] run tag @s add blaze_warden_fire_wall_faced
execute if entity @e[tag=blaze_warden_fire_wall] as @e[tag=blaze_warden_fire_wall] at @s run playsound minecraft:entity.firework_rocket.large_blast hostile @a[distance=0..20] ~ ~ ~ 1 0.5 1
execute if entity @e[tag=blaze_warden_fire_wall] as @e[tag=blaze_warden_fire_wall] at @s if block ~ ~ ~ minecraft:air unless block ~ ~-1 ~ minecraft:air run setblock ~ ~ ~ fire
execute if entity @e[tag=blaze_warden_fire_wall] as @e[tag=blaze_warden_fire_wall] at @s if block ~ ~ ~ minecraft:air unless block ~ ~-1 ~ minecraft:air run tp @s ^ ^ ^1
execute if entity @e[tag=blaze_warden_fire_wall] as @e[tag=blaze_warden_fire_wall] at @s unless block ~ ~ ~ minecraft:air if block ~ ~1 ~ minecraft:air run tp @s ~ ~1 ~
execute if entity @e[tag=blaze_warden_fire_wall] as @e[tag=blaze_warden_fire_wall] at @s unless block ~ ~ ~ minecraft:air if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute if entity @e[tag=blaze_warden_fire_wall] as @e[tag=blaze_warden_fire_wall] at @s if block ~ ~ ~ minecraft:air if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~

