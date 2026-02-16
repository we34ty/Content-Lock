execute if score @s content_lock.attack_timer matches 0 run scoreboard players set @s content_lock.attack_timer 70

execute if score @s content_lock.attack_timer matches 70 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/disable_movement
execute if score @s content_lock.attack_timer matches 70 run tag @s add content_lock.second_officer.attacking
execute if score @s content_lock.attack_timer matches 70 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/walk/stop
execute if score @s content_lock.attack_timer matches 70 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/idle/stop
execute if score @s content_lock.attack_timer matches 70 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/up_down_long/play

execute if score @s content_lock.attack_timer matches 70 at @n[tag=content_lock.im_a_target] run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.second_officer.temp_target],Duration:30,Radius:0,custom_particle:{type:"block",block_state:"air"}}
execute if score @s content_lock.attack_timer matches ..70 run rotate @s facing entity @n[tag=content_lock.second_officer.temp_target] eyes

execute if score @s content_lock.attack_timer matches 54 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.8
execute if score @s content_lock.attack_timer matches 40 run playsound entity.player.attack.knockback hostile @a ~ ~ ~ 1 0.5

execute if score @s content_lock.attack_timer matches 52..54 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^1 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1,distance:2}

execute if score @s content_lock.attack_timer matches 35..37 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^1 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1,distance:2}
execute if score @s content_lock.attack_timer matches 35..37 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^2 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1,distance:2}
execute if score @s content_lock.attack_timer matches 35..37 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^3 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1,distance:2}

execute if score @s content_lock.attack_timer matches 25 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/up_down_long/stop
execute if score @s content_lock.attack_timer matches 25 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/enable_movement
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.second_officer.up_down_long
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.standing
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.walking
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.second_officer.attacking