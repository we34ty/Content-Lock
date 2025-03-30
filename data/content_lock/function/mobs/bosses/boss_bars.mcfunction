execute if entity @e[type=zombified_piglin, tag=zombified_piglin_princess] as @e[type=zombified_piglin, tag=zombified_piglin_princess, limit=1, sort=arbitrary] store result bossbar minecraft:zombified_piglin_princess max run attribute @s generic.max_health get 2
execute if entity @e[type=zombified_piglin, tag=zombified_piglin_princess] as @e[type=zombified_piglin, tag=zombified_piglin_princess, limit=1, sort=arbitrary] store result bossbar minecraft:zombified_piglin_princess value run data get entity @s Health
execute if entity @e[type=zombified_piglin, tag=zombified_piglin_princess] as @e[type=zombified_piglin, tag=zombified_piglin_princess, limit=1, sort=arbitrary] at @s run bossbar set minecraft:zombified_piglin_princess players @a[distance=0..50] 
execute if entity @e[type=zombified_piglin, tag=zombified_piglin_princess_phase_1] as @e[type=zombified_piglin, tag=zombified_piglin_princess_phase_1, limit=1, sort=arbitrary] at @s run bossbar set minecraft:zombified_piglin_princess players @a[distance=0..50] 

execute if entity @e[type=ghast, tag=ghast_revolution_leader] as @e[type=ghast, tag=ghast_revolution_leader, limit=1, sort=arbitrary] store result bossbar minecraft:ghast_revolution_leader max run attribute @s generic.max_health get
execute if entity @e[type=ghast, tag=ghast_revolution_leader] as @e[type=ghast, tag=ghast_revolution_leader, limit=1, sort=arbitrary] store result bossbar minecraft:ghast_revolution_leader value run data get entity @s Health
execute if entity @e[type=ghast, tag=ghast_revolution_leader] as @e[type=ghast, tag=ghast_revolution_leader, limit=1, sort=arbitrary] at @s run bossbar set minecraft:ghast_revolution_leader players @a[distance=0..50] 

execute if entity @e[type=wither_skeleton, tag=wither_skeleton_revolution_leader] as @e[type=wither_skeleton, tag=wither_skeleton_revolution_leader, limit=1, sort=arbitrary] store result bossbar minecraft:wither_skeleton_revolution_leader max run attribute @s generic.max_health get 3.5
execute if entity @e[type=wither_skeleton, tag=wither_skeleton_revolution_leader] as @e[type=wither_skeleton, tag=wither_skeleton_revolution_leader, limit=1, sort=arbitrary] store result bossbar minecraft:wither_skeleton_revolution_leader value run data get entity @s Health
execute if entity @e[type=wither_skeleton, tag=wither_skeleton_revolution_leader] as @e[type=wither_skeleton, tag=wither_skeleton_revolution_leader, limit=1, sort=arbitrary] at @s run bossbar set minecraft:wither_skeleton_revolution_leader players @a[distance=0..50] 

execute if entity @e[type=blaze, tag=blaze_lord] as @e[type=blaze, tag=blaze_lord, limit=1, sort=arbitrary] store result bossbar minecraft:blaze_lord max run attribute @s generic.max_health get
execute if entity @e[type=blaze, tag=blaze_lord] as @e[type=blaze, tag=blaze_lord, limit=1, sort=arbitrary] store result bossbar minecraft:blaze_lord value run data get entity @s Health
execute if entity @e[type=blaze, tag=blaze_lord] as @e[type=blaze, tag=blaze_lord, limit=1, sort=arbitrary] at @s run bossbar set minecraft:blaze_lord players @a[distance=0..50] 

execute if entity @e[type=phantom, tag=ender_watcher] as @e[type=phantom, tag=ender_watcher, limit=1, sort=arbitrary] store result bossbar minecraft:ender_watcher max run attribute @s generic.max_health get
execute if entity @e[type=phantom, tag=ender_watcher] as @e[type=phantom, tag=ender_watcher, limit=1, sort=arbitrary] store result bossbar minecraft:ender_watcher value run data get entity @s Health
execute if entity @e[type=phantom, tag=ender_watcher] as @e[type=phantom, tag=ender_watcher, limit=1, sort=arbitrary] at @s run bossbar set minecraft:ender_watcher players @a[distance=0..200] 

execute if entity @e[type=enderman, tag=dragons_apprentice_phase_1] as @e[type=enderman, tag=dragons_apprentice_phase_1, limit=1, sort=arbitrary] store result bossbar minecraft:dragons_apprentice_phase_1 max run attribute @s generic.max_health get
execute if entity @e[type=enderman, tag=dragons_apprentice_phase_1] as @e[type=enderman, tag=dragons_apprentice_phase_1, limit=1, sort=arbitrary] store result bossbar minecraft:dragons_apprentice_phase_1 value run data get entity @s Health
execute if entity @e[type=enderman, tag=dragons_apprentice_phase_1] as @e[type=enderman, tag=dragons_apprentice_phase_1, limit=1, sort=arbitrary] at @s run bossbar set minecraft:dragons_apprentice_phase_1 players @a[distance=0..50] 

execute if entity @e[type=enderman, tag=dragons_apprentice_phase_2] as @e[type=enderman, tag=dragons_apprentice_phase_2, limit=1, sort=arbitrary] store result bossbar minecraft:dragons_apprentice_phase_2 max run attribute @s generic.max_health get
execute if entity @e[type=enderman, tag=dragons_apprentice_phase_2] as @e[type=enderman, tag=dragons_apprentice_phase_2, limit=1, sort=arbitrary] store result bossbar minecraft:dragons_apprentice_phase_2 value run data get entity @s Health
execute if entity @e[type=enderman, tag=dragons_apprentice_phase_2] as @e[type=enderman, tag=dragons_apprentice_phase_2, limit=1, sort=arbitrary] at @s run bossbar set minecraft:dragons_apprentice_phase_2 players @a[distance=0..50] 

execute if entity @e[type=piglin, tag=zomcess_overworld] as @e[type=piglin, tag=zomcess_overworld, limit=1, sort=arbitrary] store result bossbar minecraft:zomcess_overworld max run attribute @s generic.max_health get
execute if entity @e[type=piglin, tag=zomcess_overworld] as @e[type=piglin, tag=zomcess_overworld, limit=1, sort=arbitrary] store result bossbar minecraft:zomcess_overworld value run data get entity @s Health
execute if entity @e[type=piglin, tag=zomcess_overworld] as @e[type=piglin, tag=zomcess_overworld, limit=1, sort=arbitrary] at @s run bossbar set minecraft:zomcess_overworld players @a[distance=0..50] 

execute if entity @e[type=piglin, tag=zomcess_overworld] as @e[type=piglin, tag=zomcess_overworld, limit=1, sort=arbitrary] store result bossbar minecraft:zomcess_connection value run scoreboard players get @s zomcess_connection
execute if entity @e[type=piglin, tag=zomcess_overworld] as @e[type=piglin, tag=zomcess_overworld, limit=1, sort=arbitrary] at @s run bossbar set minecraft:zomcess_connection players @a[distance=0..50] 

execute if entity @e[type=spider, tag=glitched_bug] as @e[type=spider, tag=glitched_bug, limit=1, sort=arbitrary] store result bossbar minecraft:glitched_bug value run data get entity @s AbsorptionAmount
execute if entity @e[type=spider, tag=glitched_bug] as @e[type=spider, tag=glitched_bug, limit=1, sort=arbitrary] at @s run bossbar set minecraft:glitched_bug players @a[distance=0..50] 

execute if entity @e[type=slime, tag=slime_god] as @e[type=slime, tag=slime_god, limit=1, sort=arbitrary] store result bossbar minecraft:slime_god max run attribute @s generic.max_health get
execute if entity @e[type=slime, tag=slime_god] as @e[type=slime, tag=slime_god, limit=1, sort=arbitrary] store result bossbar minecraft:slime_god value run data get entity @s Health
execute if entity @e[type=slime, tag=slime_god,scores={enchanted_books=..0}] as @e[type=slime, tag=slime_god, limit=1, sort=arbitrary,scores={enchanted_books=..0}] at @s run bossbar set minecraft:slime_god players @a[distance=0..50] 

execute if entity @e[type=slime, tag=slime_god] as @e[type=slime, tag=slime_god, limit=1, sort=arbitrary] store result bossbar minecraft:slime_god_shield value run data get entity @s AbsorptionAmount
execute if entity @e[type=slime, tag=slime_god,scores={enchanted_books=1..}] as @e[type=slime, tag=slime_god, limit=1, sort=arbitrary,scores={enchanted_books=1..}] at @s run bossbar set minecraft:slime_god_shield players @a[distance=0..50] 
