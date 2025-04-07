scoreboard players set @s corruption_meter 1000
scoreboard players add @e[distance=0..5,type=!#entities] corruption_meter 1
particle minecraft:crimson_spore ~ ~1 ~ 0.3 1.6 0.3 1 2 force @a

attribute @s generic.movement_speed base set 0.4

execute as @a[distance=0..40] store result score @s zombified_piglin_princess_phase_1_health run bossbar get zombified_piglin_princess value 
execute as @a[distance=0..40] run scoreboard players set @s temporary_health_holder 50
execute as @a[distance=0..40] run scoreboard players operation @s zombified_piglin_princess_phase_1_health -= @s temporary_health_holder

function content_lock:bosses/boss_music {song:custom.corrupted_princess_enemies,duration:3860}

scoreboard players set @s zombi_piglin_amount 0
execute as @e[type=zombified_piglin,distance=0..40] run scoreboard players add @e[tag=zombified_piglin_princess_phase_1,distance=0..40] zombi_piglin_amount 1

execute if score @s zombi_piglin_amount matches 8.. as @e[type=zombified_piglin,limit=1,distance=0..40,tag=!zombified_piglin_princess_phase_1,tag=!zombified_piglin_princess,sort=furthest] run function content_lock:bosses/boss_despawn


execute if entity @s[tag=!sumoned_so_started] run summon zombified_piglin ~-1 ~ ~
execute if entity @s[tag=!sumoned_so_started] run summon zombified_piglin ~1 ~ ~
execute if entity @s[tag=!sumoned_so_started] run summon zombified_piglin ~ ~ ~1
execute if entity @s[tag=!sumoned_so_started] run summon zombified_piglin ~ ~ ~-1
execute if entity @s[tag=!sumoned_so_started] run tag @s add sumoned_so_started