execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 200
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 160
execute if entity @s[scores={content_lock.attack_timer=160}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=160}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=160}] run playsound entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 2 1.6
execute if entity @s[scores={content_lock.attack_timer=150}] run playsound entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 2 1.6
execute if entity @s[scores={content_lock.attack_timer=140}] run playsound entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 2 1.6
execute if entity @s[scores={content_lock.attack_timer=130..160}] run particle crit ~ ~1 ~ 1 1 1 1 30 normal @a

execute if entity @s[scores={content_lock.attack_timer=110..160}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run particle block{block_state:dirt} ~ ~ ~ 0.3 0.3 0.3 1 6 normal

execute if entity @s[scores={content_lock.attack_timer=130}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=130}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] facing entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,limit=1,sort=nearest] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=130}] facing entity @e[tag=content_lock.im_a_target,type=#boss_can_damage,limit=1,sort=nearest] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=130}] run data merge storage content_lock:saved_stats {boss_speed:0}
execute if entity @s[scores={content_lock.attack_timer=130}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run execute store result storage content_lock:saved_stats boss_speed double 0.01 run attribute @s movement_speed get 500
execute if entity @s[scores={content_lock.attack_timer=110..130}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run function content_lock:mobs/bosses/death_rider/rush_on_horse_motion with storage content_lock:saved_stats
execute if entity @s[scores={content_lock.attack_timer=110..130}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=110..130}] run particle small_flame ~ ~1 ~ 0.1 0.1 0.1 0.3 5 normal @a

execute if entity @s[scores={content_lock.attack_timer=110}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=110}] run tag @s remove content_lock.death_rider.rush_on_horse