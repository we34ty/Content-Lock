execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 210
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 160
execute if entity @s[scores={content_lock.attack_timer=160}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=160}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=160}] run playsound entity.zombie.attack_iron_door hostile @a ~ ~ ~ 3 1.6
execute if entity @s[scores={content_lock.attack_timer=150}] run playsound entity.zombie.attack_iron_door hostile @a ~ ~ ~ 3 1.6
execute if entity @s[scores={content_lock.attack_timer=140}] run playsound entity.zombie.attack_iron_door hostile @a ~ ~ ~ 3 1.6
execute if entity @s[scores={content_lock.attack_timer=130..160}] run particle crit ~ ~1 ~ 1 1 1 1 30 normal @a

execute if entity @s[scores={content_lock.attack_timer=131}] facing entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,limit=1,sort=nearest] feet rotated ~ 0 run summon area_effect_cloud ^ ^ ^40 {Duration:32,Tags:[content_lock.death_rider.rush_without_horse.area]}
execute if entity @s[scores={content_lock.attack_timer=131}] facing entity @e[tag=content_lock.death_rider.rush_without_horse.area,limit=1,sort=nearest] feet rotated ~ 0 run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=130}] run tag @s add content_lock.death_rider.rush_without_horse.dismount
execute if entity @s[scores={content_lock.attack_timer=130}] run ride @s dismount
execute if entity @s[scores={content_lock.attack_timer=130}] run data merge storage content_lock:saved_stats {boss_speed:0}
execute if entity @s[scores={content_lock.attack_timer=130}] run execute store result storage content_lock:saved_stats boss_speed double 0.01 run attribute @s movement_speed get 800
execute if entity @s[scores={content_lock.attack_timer=110..130}] run function content_lock:mobs/bosses/death_rider/rush_without_horse_motion with storage content_lock:saved_stats
execute if entity @s[scores={content_lock.attack_timer=110..130}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=110..130}] run particle flame ~ ~1 ~ 0.1 0.1 0.1 0.3 5 normal @a

execute if entity @s[scores={content_lock.attack_timer=110..130}] positioned ~-1 ~-1 ~-1 if entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,dx=2,dy=2,dz=2] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run particle soul ~ ~1 ~ 0.3 0.3 0.3 0.4 40 normal @a
execute if entity @s[scores={content_lock.attack_timer=110..130}] positioned ~-1 ~-1 ~-1 if entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,dx=2,dy=2,dz=2] run playsound entity.zombie.hurt hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={content_lock.attack_timer=110..130}] positioned ~-1 ~-1 ~-1 if entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,dx=2,dy=2,dz=2] run particle flame ~ ~1 ~ 1 1 1 1 50 normal @a 
execute if entity @s[scores={content_lock.attack_timer=110..130}] positioned ~-1 ~-1 ~-1 if entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,dx=2,dy=2,dz=2] run tp @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] @s
execute if entity @s[scores={content_lock.attack_timer=110..130}] positioned ~-1 ~-1 ~-1 if entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,dx=2,dy=2,dz=2] run scoreboard players set @s content_lock.attack_timer 110

execute if entity @s[scores={content_lock.attack_timer=110}] run tag @s remove content_lock.death_rider.rush_without_horse.dismount
execute if entity @s[scores={content_lock.attack_timer=100}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s remove content_lock.death_rider.rush_without_horse