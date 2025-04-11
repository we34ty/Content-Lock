scoreboard players set @s corruption_meter 1000
scoreboard players set @e[tag=zombified_piglin_defense,type=zombified_piglin,distance=0..30] corruption_meter 1000
scoreboard players add @e[distance=0..20,type=!#entities,tag=!corrupted_meter_full] corruption_meter 1
scoreboard players add @s attack_timer 0
#execute if entity @s if predicate content_lock:random if predicate content_lock:random if predicate content_lock:random if predicate content_lock:true_random run summon zombified_piglin ~ ~ ~ {Tags:[zombified_piglin_defense],Glowing:1}

scoreboard players set @s zombi_piglin_amount 0
execute as @e[type=zombified_piglin,distance=0..40] run scoreboard players add @e[tag=zombified_piglin_princess,distance=0..40] zombi_piglin_amount 1

execute if score @s zombi_piglin_amount matches 4.. as @e[type=zombified_piglin,limit=1,distance=0..40,tag=!zombified_piglin_princess,tag=!zombified_piglin_defense,sort=furthest] run function content_lock:bosses/boss_despawn

setblock ~ ~1 ~ air destroy

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=7..40] if predicate content_lock:three_random run tag @s add fireball_attack
execute if entity @s[tag=fireball_attack] run function content_lock:bosses/zombified_piglin_princess/fireball_attack

execute if entity @e[tag=zombified_piglin_princess_fireball] as @e[tag=zombified_piglin_princess_fireball] at @s run function content_lock:bosses/zombified_piglin_princess/zombified_piglin_princess_fireball

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=10..40] unless entity @e[tag=zombified_piglin_defense,distance=0..30] run tag @s add spawning_defensive_zombie
execute if entity @s[tag=spawning_defensive_zombie] run function content_lock:bosses/zombified_piglin_princess/spawning_defensive_zombie

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=0..5] if predicate content_lock:three_random run tag @s add fire_gay
execute if entity @s[tag=fire_gay] run function content_lock:bosses/zombified_piglin_princess/fire_gay

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=2..7] if predicate content_lock:three_random run tag @s add quickstep_to_player
execute if entity @s[tag=quickstep_to_player] run function content_lock:bosses/zombified_piglin_princess/quickstep_to_player

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=6..9] run tag @s add short_range_laser
execute if entity @s[tag=short_range_laser] run function content_lock:bosses/zombified_piglin_princess/short_range_laser

execute if entity @e[tag=zombified_piglin_princess_laser] as @e[tag=zombified_piglin_princess_laser] at @s run function content_lock:bosses/zombified_piglin_princess/zombified_piglin_princess_laser

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=0..5] run tag @s add leap_at_player
execute if entity @s[tag=leap_at_player] run function content_lock:bosses/zombified_piglin_princess/leap_at_player

execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=120..}] run scoreboard players set @s attack_timer 0

execute if score L timer1 matches 7 run function content_lock:bosses/boss_player_count_scaling {distance:40}

function content_lock:bosses/boss_music {song:music.content_lock.corrupted_princess,duration:3940}

execute as @e[tag=zombified_piglin_defense] if entity @s[team=!piglin_light] run team join piglin_light @s
execute if entity @e[tag=zombified_piglin_defense,distance=0..30] run effect give @s resistance 1 255
execute if entity @e[tag=zombified_piglin_defense,tag=!telported_already,type=zombified_piglin,distance=0..30] as @e[tag=zombified_piglin_defense,tag=!telported_already,type=zombified_piglin,distance=0..30] if entity @e[tag=!zombified_piglin_princess,type=zombified_piglin,distance=0..20] run tp @s @e[tag=!zombified_piglin_princess,type=zombified_piglin,distance=0..15,limit=1,sort=random] 
execute if entity @e[tag=zombified_piglin_defense,tag=!telported_already,type=zombified_piglin,distance=0..30] as @e[tag=zombified_piglin_defense,tag=!telported_already,type=zombified_piglin,distance=0..30] if entity @e[tag=!zombified_piglin_princess,type=zombified_piglin,distance=0..20] run tag @s add telported_already

