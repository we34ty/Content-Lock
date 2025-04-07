time set midnight
data modify entity @s Fire set value -1
scoreboard players add @s attack_timer 0

scoreboard players add @s progression 1
execute if entity @s[tag=ender_watcher_laser,scores={progression=200..}] at @s run data merge entity @s {NoAI:0b}
execute if entity @s[scores={progression=200..}] run tag @s remove ender_watcher_laser
execute if entity @s[scores={progression=200..}] run tag @s remove ender_watcher_teleportation
execute if entity @s[scores={progression=200..}] run tag @s remove ender_watcher_shotgun
execute if entity @s[scores={progression=200..}] run tag @s remove ender_watcher_rain
execute if entity @s[scores={progression=200..}] at @s run fill ~20 ~ ~20 ~-20 ~ ~-20 minecraft:air replace minecraft:fire
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_rain
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_shotgun
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_teleportation
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_laser
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_rain
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_shotgun
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add ender_watcher_teleportation
execute if entity @s[scores={progression=200..}] if entity @s[tag=!ender_watcher_rain,tag=!ender_watcher_shotgun,tag=!ender_watcher_teleportation,tag=!ender_watcher_laser] run tag @s add ender_watcher_laser
execute if entity @s[scores={progression=200..}] run scoreboard players set @s progression 0

execute if entity @s[tag=ender_watcher_laser] at @s if entity @p[distance=0..80] at @p run summon area_effect_cloud ~ ~ ~ {Duration:10,Tags:[ender_watcher_laser_target]}
execute if entity @s[tag=ender_watcher_laser,scores={progression=0}] at @s run data merge entity @s {NoAI:1b}
execute if entity @s[tag=ender_watcher_laser,scores={progression=10..}] at @s run summon armor_stand ~ ~0.4 ~ {Marker:1b,NoGravity:1b,Tags:[ender_watcher_laser_beam],CustomName:'[{"text":"Ender Watcher Laser Beam","color":"light_purple"}]'}
#execute as @s if entity @s[tag=ender_watcher_laser_beam] at @s facing entity @e[tag=ender_watcher_laser_target,limit=1,sort=arbitrary] feet run tp @s ~ ~ ~ ~ ~
execute as @e[tag=ender_watcher_laser_beam] at @s facing entity @e[tag=ender_watcher_laser_target,limit=1,sort=arbitrary] feet run tp @s ~ ~ ~ ~ ~
execute as @e[tag=ender_watcher_laser_beam] at @s rotated as @e[tag=ender_watcher_laser,limit=1,sort=nearest] run function content_lock:ender_watcher_laser_beam

execute if entity @s[tag=ender_watcher_teleportation] if entity @s[nbt={HurtTime:9s}] at @s if entity @p[distance=0..80] at @p run spreadplayers ~ ~ 3 10 true @s 
execute if entity @s[tag=ender_watcher_teleportation,scores={progression=0}] at @s if entity @p[distance=0..80] at @p run spreadplayers ~ ~ 3 10 true @s 
execute if entity @s[tag=ender_watcher_teleportation,scores={progression=100}] at @s if entity @p[distance=0..80] at @p run spreadplayers ~ ~ 3 10 true @s 
execute if entity @s[tag=ender_watcher_teleportation,scores={progression=199}] at @s if entity @p[distance=0..80] at @p run spreadplayers ~ ~ 3 10 true @s 

execute if entity @s[tag=ender_watcher_rain,scores={progression=0..160}] at @s if entity @p[distance=0..80] run summon falling_block ~ ~ ~ {BlockState:{Properties:{facing:"down"},Name:end_rod},Time:567,Motion:[0d,-0.5d,0d],display:{Name:'[{"text":"ender_watcher_rain_projectile","italic":false}]'},Tags:[ender_watcher_rain_projectile]}
execute if entity @s[tag=ender_watcher_rain] at @s if entity @e[distance=0..1,tag=ender_watcher_rain_projectile] as @e[distance=0..3,tag=ender_watcher_rain_projectile] at @s run tag @s add ender_watcher_rain_projectile_teleport

execute if entity @e[tag=ender_watcher_rain_projectile_teleport] as @e[tag=ender_watcher_rain_projectile_teleport] at @p run spreadplayers ~ ~ 0 5 false @s 
execute if entity @e[tag=ender_watcher_rain_projectile_teleport] as @e[tag=ender_watcher_rain_projectile_teleport] at @s run tp @s ~ ~20 ~
execute if entity @e[tag=ender_watcher_rain_projectile_teleport] as @e[tag=ender_watcher_rain_projectile_teleport] at @s run tag @s remove ender_watcher_rain_projectile_teleport

execute if entity @e[tag=ender_watcher_rain_projectile] as @e[tag=ender_watcher_rain_projectile] at @s run kill @e[nbt={Item:{id:"minecraft:end_rod",Count:1b}},distance=0..5]
execute if entity @e[tag=ender_watcher_rain_projectile] as @e[tag=ender_watcher_rain_projectile] at @s run damage @r[distance=0..2] 20 magic by @s

execute if entity @s[tag=ender_watcher_shotgun] if entity @s[nbt={HurtTime:9s}] at @s run summon phantom ~ ~ ~
execute if entity @s[tag=ender_watcher_shotgun] run scoreboard players add @s enchanting_tables 1
execute if entity @s[tag=ender_watcher_shotgun,scores={enchanting_tables=20..}] run summon phantom
execute if entity @s[tag=ender_watcher_shotgun,scores={enchanting_tables=20..}] run scoreboard players set @s enchanting_tables 0



execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=120..}] run scoreboard players set @s attack_timer 0
