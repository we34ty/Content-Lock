execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players add @s content_lock.boss_exhaustion 70

execute if entity @s[scores={content_lock.attack_timer=100}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:21,Tags:["content_lock.zombified_piglin_princess.left_right_combo.3.area"]}
execute if entity @s[scores={content_lock.attack_timer=80..100}] run playsound entity.generic.burn hostile @a ~ ~ ~ 0.3 1
execute if entity @s[scores={content_lock.attack_timer=70..80}] run playsound block.furnace.fire_crackle hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=80..100}] positioned ~ ~2 ~ positioned ^2 ^ ^ run particle dust{color:14680172,scale:1.5} ~ ~ ~ 0.2 0.2 0.2 0.5 10 force @a
execute if entity @s[scores={content_lock.attack_timer=80..100}] positioned ~ ~2 ~ positioned ^-2 ^ ^ run particle dust{color:14680172,scale:1.5} ~ ~ ~ 0.2 0.2 0.2 0.5 10 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 1

execute if entity @s[scores={content_lock.attack_timer=82}] run rotate @s facing entity @e[tag=content_lock.zombified_piglin_princess.phase_in.combo1.area,limit=1,sort=nearest] eyes
execute if entity @s[scores={content_lock.attack_timer=82}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=80}] run data merge storage content_lock:saved_stats {boss_speed:1}
execute if entity @s[scores={content_lock.attack_timer=80}] store result storage content_lock:saved_stats boss_speed double 0.01 run attribute @s movement_speed get 1000
execute if entity @s[scores={content_lock.attack_timer=80}] run function content_lock:mobs/bosses/zombified_piglin_princess/left_right_combo/3_motion with storage content_lock:saved_stats

execute if entity @s[scores={content_lock.attack_timer=70..80}] positioned ~ ~1 ~ positioned ^ ^ ^2 run particle crit ~ ~ ~ 0.4 0.4 0.4 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=70..80}] positioned ~ ~1 ~ positioned ^ ^ ^3 run particle crit ~ ~ ~ 0.4 0.4 0.4 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=70..80}] positioned ~ ~1 ~ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.5,distance:1,damage:5,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=70..80}] positioned ~ ~1 ~ positioned ^ ^ ^2 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.5,distance:1,damage:5,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=70..80}] positioned ~ ~1 ~ positioned ^ ^ ^3 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.5,distance:1,damage:5,damage_type:mob_attack}

