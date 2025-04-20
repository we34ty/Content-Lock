execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 130
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120
execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=120}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=120}] run playsound block.beacon.activate hostile @a ~ ~ ~ 3 1
execute if entity @s[scores={content_lock.attack_timer=120}] at @e[tag=content_lock.im_a_target,type=#boss_can_damage,limit=1,sort=nearest] run summon area_effect_cloud ~ ~ ~ {Duration:41,Tags:["content_lock.death_rider.spin_teleport.area"]}
execute if entity @s[scores={content_lock.attack_timer=90..120}] at @e[tag=content_lock.death_rider.spin_teleport.area] run particle portal ~ ~1 ~ 0.1 0.1 0.1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=90..120}] at @e[tag=content_lock.death_rider.spin_teleport.area] run particle soul ~ ~1 ~ 0.1 1 0.1 0.05 5 normal @a
execute if entity @s[scores={content_lock.attack_timer=60..120}] run rotate @s ~35 0
execute if entity @s[scores={content_lock.attack_timer=60..120}] positioned ~ ~1.5 ~ positioned ^ ^ ^2 run particle soul_fire_flame ~ ~ ~ 0.1 0.1 0.1 0.1 3 force @a
execute if entity @s[scores={content_lock.attack_timer=60..120}] positioned ~ ~1.5 ~ positioned ^ ^ ^2 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=60..120}] positioned ~ ~1.5 ~ positioned ^ ^ ^3 run particle soul_fire_flame ~ ~ ~ 0.1 0.1 0.1 0.1 3 force @a
execute if entity @s[scores={content_lock.attack_timer=60..120}] positioned ~ ~1.5 ~ positioned ^ ^ ^3 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:mob_attack}

execute if entity @s[scores={content_lock.attack_timer=80}] at @e[tag=content_lock.death_rider.spin_teleport.area,limit=1,sort=nearest] run tp @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] ~ ~ ~
execute if entity @s[scores={content_lock.attack_timer=79}] run playsound block.beacon.deactivate hostile @a ~ ~ ~ 3 1.3
execute if entity @s[scores={content_lock.attack_timer=79}] run particle reverse_portal ~ ~1 ~ 0.1 0.1 0.1 1 60 normal @a
execute if entity @s[scores={content_lock.attack_timer=79}] run particle soul_fire_flame ~ ~1 ~ 0.1 0.1 0.1 0.5 20 normal @a

execute if entity @s[scores={content_lock.attack_timer=60}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=60}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.death_rider.spin_teleport