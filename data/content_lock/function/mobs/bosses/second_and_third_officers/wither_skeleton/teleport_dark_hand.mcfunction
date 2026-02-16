execute if score @s content_lock.attack_timer matches 0 run scoreboard players set @s content_lock.attack_timer 80

execute if score @s content_lock.attack_timer matches 80 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/disable_movement
execute if score @s content_lock.attack_timer matches 80 run tag @s add content_lock.second_officer.attacking
execute if score @s content_lock.attack_timer matches 80 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/walk/stop
execute if score @s content_lock.attack_timer matches 80 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/idle/stop
execute if score @s content_lock.attack_timer matches 80 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/teleport_dark_hand/play

execute if score @s content_lock.attack_timer matches 61 at @n[tag=content_lock.im_a_target] run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.second_officer.temp_target],Duration:5,Radius:0,custom_particle:{type:"block",block_state:"air"}}
execute if score @s content_lock.attack_timer matches ..61 run rotate @s facing entity @n[tag=content_lock.second_officer.temp_target] eyes

execute if score @s content_lock.attack_timer matches 61 at @n[tag=content_lock.second_officer.temp_target] positioned over motion_blocking run tp @s ~ ~ ~

execute if score @s content_lock.attack_timer matches 40..50 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^0.5 run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:0.5,distance:1}

execute if score @s content_lock.attack_timer matches 40 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/teleport_dark_hand/stop
execute if score @s content_lock.attack_timer matches 40 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/enable_movement
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.second_officer.teleport_dark_hand
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.standing
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.walking
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.second_officer.attacking