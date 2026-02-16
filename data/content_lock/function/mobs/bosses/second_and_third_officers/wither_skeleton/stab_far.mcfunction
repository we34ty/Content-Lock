execute if score @s content_lock.attack_timer matches 0 run scoreboard players set @s content_lock.attack_timer 100

execute if score @s content_lock.attack_timer matches 100 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/disable_movement
execute if score @s content_lock.attack_timer matches 100 run attribute @s safe_fall_distance modifier add content_lock.no_fall_damage 100 add_value
execute if score @s content_lock.attack_timer matches 100 run tag @s add content_lock.second_officer.attacking
execute if score @s content_lock.attack_timer matches 100 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/walk/stop
execute if score @s content_lock.attack_timer matches 100 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/idle/stop
execute if score @s content_lock.attack_timer matches 100 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/stab_far/play
execute if score @s content_lock.attack_timer matches 70..100 run rotate @s facing entity @n[tag=content_lock.im_a_target] eyes

execute if score @s content_lock.attack_timer matches 69 at @n[tag=content_lock.im_a_target] run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.second_officer.temp_target],Duration:40,Radius:0,custom_particle:{type:"block",block_state:"air"}}
execute if score @s content_lock.attack_timer matches ..69 run rotate @s facing entity @n[tag=content_lock.second_officer.temp_target] eyes

execute if score @s content_lock.attack_timer matches 70 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/jump_motion

execute if score @s content_lock.attack_timer matches 56..65 facing entity @n[tag=content_lock.second_officer.temp_target] feet rotated ~ 0 positioned ^ ^ ^1 run function content_lock:mobs/bosses/universal/damage_player_d {damage:1,damage_type:mob_attack,half_distance:1,distance:2}

execute if score @s content_lock.attack_timer matches 56..68 if entity @s[nbt={OnGround:1b}] as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/jump/apply_frame {frame:45}
execute if score @s content_lock.attack_timer matches 56..68 if entity @s[nbt={OnGround:1b}] as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run scoreboard players set @s content_lock.attack_timer 55

execute if score @s content_lock.attack_timer matches 40 as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/stab_far/stop
execute if score @s content_lock.attack_timer matches 40 run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/enable_movement
execute if score @s content_lock.attack_timer matches 40 run attribute @s safe_fall_distance modifier remove content_lock.no_fall_damage
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.second_officer.stab_far
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.standing
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.walking
execute if score @s content_lock.attack_timer matches 40 run tag @s remove content_lock.second_officer.attacking
execute if score @s content_lock.attack_timer matches 40 run kill @n[tag=content_lock.second_officer.temp_target]