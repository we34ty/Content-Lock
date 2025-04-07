#tp @s ~ ~-1 ~
execute unless block ~ ~ ~ #minecraft:walkable run effect give @e[type=!player,type=!#entitites,distance=0..5] resistance 1 255 true
execute unless block ~ ~ ~ #minecraft:walkable run summon tnt

execute if entity @s[scores={timer1=0}] positioned ~ ~-6 ~ if entity @p[distance=12..36] positioned ~ ~-6 ~ facing entity @p eyes positioned ~ ~12 ~ if block ^ ^ ^0.2 #walkable run tp @s ^ ^ ^0.2 ~ ~
execute if entity @s[scores={timer1=0}] positioned ~ ~-6 ~ if entity @p[distance=..12] facing entity @p eyes rotated ~ 0 positioned ~ ~5.7 ~ if block ^ ^ ^-0.2 #walkable run tp @s ^ ^ ^-0.2 ~ ~
execute if entity @p[distance=37..] facing entity @p eyes run tp @s ^ ^ ^0.4 ~ ~

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=..6] run tag @s add evading_an_attack
execute if entity @s[tag=evading_an_attack] run function content_lock:bosses/second_and_third_officers/evading_an_attack

#if predicate content_lock:miniscule_chance 
#execute if entity @s[scores={attack_timer=0}] positioned ~ ~-6 ~ if entity @p[distance=12..40] run tag @s add hollow_purple
execute if entity @s[scores={attack_timer=0}] positioned ~ ~-6 ~ if entity @p[distance=12..40] if predicate content_lock:random if predicate content_lock:random run tag @s add hollow_purple
execute if entity @s[tag=hollow_purple] run function content_lock:bosses/second_and_third_officers/hollow_purple

execute if entity @s[scores={attack_timer=0}] positioned ~ ~-6 ~ if entity @p[distance=12..40] if predicate content_lock:true_random run tag @s add fireball_attack_red
execute if entity @s[tag=fireball_attack_red] run function content_lock:bosses/second_and_third_officers/fireball_attack_red

execute if entity @s[scores={attack_timer=0}] positioned ~ ~-6 ~ if entity @p[distance=12..40] run tag @s add fireball_attack_blue
execute if entity @s[tag=fireball_attack_blue] run function content_lock:bosses/second_and_third_officers/fireball_attack_blue

execute if entity @e[tag=ghast_revolution_leader_fireball_red] as @e[tag=ghast_revolution_leader_fireball_red] at @s run function content_lock:bosses/second_and_third_officers/ghast_revolution_leader_fireball_red
execute if entity @e[tag=ghast_revolution_leader_fireball_blue] as @e[tag=ghast_revolution_leader_fireball_blue] at @s run function content_lock:bosses/second_and_third_officers/ghast_revolution_leader_fireball_blue
execute if entity @e[tag=ghast_revolution_leader_hollow_puprle1] as @e[tag=ghast_revolution_leader_hollow_puprle1] at @s run function content_lock:bosses/second_and_third_officers/ghast_revolution_leader_hollow_puprle1
execute if entity @e[tag=ghast_revolution_leader_hollow_puprle2] as @e[tag=ghast_revolution_leader_hollow_puprle2] at @s run function content_lock:bosses/second_and_third_officers/ghast_revolution_leader_hollow_puprle2
execute if entity @e[tag=ghast_revolution_leader_hollow_puprle] as @e[tag=ghast_revolution_leader_hollow_puprle] at @s run function content_lock:bosses/second_and_third_officers/ghast_revolution_leader_hollow_puprle

execute if score L timer1 matches 7 run function content_lock:bosses/boss_player_count_scaling {distance:60}

execute unless entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] run function content_lock:bosses/boss_music {song:custom.one_officer,duration:5520}
execute if entity @s[tag=!separated_leaders] unless entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] run tag @a[distance=0..40] remove listening_to_music
execute unless entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] run tag @s add separated_leaders
execute if entity @s[tag=separated_leaders] if entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] run tag @a[distance=0..40] remove listening_to_music
execute if entity @s[tag=separated_leaders] if entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] run tag @s remove separated_leaders

scoreboard players add @s attack_timer 0
scoreboard players add @s timer1 0
execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={timer1=1..}] run scoreboard players remove @s timer1 1
execute if entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] if entity @s[scores={attack_timer=200..}] run scoreboard players set @s attack_timer 0
execute unless entity @e[tag=wither_skeleton_revolution_leader,distance=0..40] if entity @s[scores={attack_timer=100..}] run scoreboard players set @s attack_timer 0