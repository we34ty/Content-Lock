execute if score @s content_lock.attack_timer matches 0 run scoreboard players set @s content_lock.attack_timer 70

execute if score @s content_lock.attack_timer matches 70 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/disable_movement
execute if score @s content_lock.attack_timer matches 70 run tag @s add content_lock.second_officer.attacking
execute if score @s content_lock.attack_timer matches 70 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/walk/stop
execute if score @s content_lock.attack_timer matches 70 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/idle/stop
execute if score @s content_lock.attack_timer matches 70 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/spin_slash/play

execute if score @s content_lock.attack_timer matches 70 at @n[tag=content_lock.im_a_target] run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.second_officer.temp_target],Duration:30,Radius:0,custom_particle:{type:"block",block_state:"air"}}
execute if score @s content_lock.attack_timer matches ..70 run rotate @s facing entity @n[tag=content_lock.second_officer.spin_slash.target] eyes

execute if score @s content_lock.attack_timer matches 54 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.8
execute if score @s content_lock.attack_timer matches 50 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.8
execute if score @s content_lock.attack_timer matches 46 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.8
execute if score @s content_lock.attack_timer matches 42 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.8
execute if score @s content_lock.attack_timer matches 38 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.8
execute if score @s content_lock.attack_timer matches 34 run playsound entity.player.attack.sweep hostile @a ~ ~ ~ 1 0.5

execute if score @s content_lock.attack_timer matches 50..52 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^1.5 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1,distance:2}
execute if score @s content_lock.attack_timer matches 47..49 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^1.6 ^ ^ positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.1,distance:2.2}
execute if score @s content_lock.attack_timer matches 45..46 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^-1.7 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.2,distance:2.4}
execute if score @s content_lock.attack_timer matches 42..44 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^-1.8 ^ ^ positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.3,distance:2.6}
execute if score @s content_lock.attack_timer matches 39..41 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^1.9 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.4,distance:2.8}
execute if score @s content_lock.attack_timer matches 36..38 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^2 ^ ^ positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.5,distance:3}
execute if score @s content_lock.attack_timer matches 33..35 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^-2.1 positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.6,distance:3.2}
execute if score @s content_lock.attack_timer matches 30..32 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^-2.2 ^ ^ positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1.7,distance:3.4}

execute if score @s content_lock.attack_timer matches 28 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^2 run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:explosion,half_distance:3,distance:6}


#execute if score @s content_lock.attack_timer matches 32..54 run particle sweep_attack ~ ~2 ~ 2 0 2 1 2 force @a

execute if score @s content_lock.attack_timer matches 30 run playsound entity.generic.explode hostile @a ~ ~ ~ 1 1.2
execute if score @s content_lock.attack_timer matches 30 run particle minecraft:explosion_emitter ^ ^ ^1 0 0 0 0.1 1 force @a
execute if score @s content_lock.attack_timer matches 30 run particle minecraft:block{block_state:"stone"} ^ ^ ^1 2 2 2 0.1 40 normal @a

execute if score @s content_lock.attack_timer matches 25 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/spin_slash/stop
execute if score @s content_lock.attack_timer matches 25 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/enable_movement
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.second_officer.spin_slash
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.standing
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.walking
execute if score @s content_lock.attack_timer matches 25 run tag @s remove content_lock.second_officer.attacking