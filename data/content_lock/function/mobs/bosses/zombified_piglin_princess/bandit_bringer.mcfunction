execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.combo_counter 0
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 140
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100
execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players add @s content_lock.combo_counter 1
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
#execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s gravity modifier add content_lock.no_speed -0.8 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s fall_damage_multiplier modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=100}] run data merge entity @s {Motion:[0.0d,0.8d,0.0d]}
execute if entity @s[scores={content_lock.attack_timer=100}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] run summon area_effect_cloud ~ ~ ~ {Duration:21,Tags:[content_lock.zombified_piglin_princess.bandit_bringer.area]}
execute if entity @s[scores={content_lock.attack_timer=81}] facing entity @e[tag=content_lock.zombified_piglin_princess.bandit_bringer.area,limit=1,sort=nearest] eyes run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=80}] run data merge storage content_lock:saved_stats {boss_speed:1}
execute if entity @s[scores={content_lock.attack_timer=80}] store result storage content_lock:saved_stats boss_speed double 0.01 run attribute @s movement_speed get 1000
execute if entity @s[scores={content_lock.attack_timer=80}] run function content_lock:mobs/bosses/zombified_piglin_princess/bandit_bringer_motion with storage content_lock:saved_stats
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 3 0.5
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 3 1.5
execute if entity @s[scores={content_lock.attack_timer=20..80}] run particle flame ~ ~ ~ 0.3 0.1 0.3 0.3 3 normal @a

execute if entity @s[scores={content_lock.attack_timer=20..80}] if entity @s[nbt={OnGround:1b}] run scoreboard players set @s content_lock.attack_timer 20

execute if entity @s[scores={content_lock.attack_timer=20}] run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a
execute if entity @s[scores={content_lock.attack_timer=20}] run particle flame ~ ~ ~ 0 0 0 1 30 normal @a
execute if entity @s[scores={content_lock.attack_timer=20}] run playsound entity.generic.explode hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=20}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:3,distance:6,damage:5,damage_type:player_explosion}

execute if entity @s[scores={content_lock.attack_timer=20}] unless score @s content_lock.combo_counter matches 3.. if entity @e[tag=content_lock.im_a_target,type=#minecraft:boss_can_damage] positioned ~-5 ~-5 ~-5 unless entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=10,dy=10,dz=10] run scoreboard players set @s content_lock.attack_timer 110
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s attack_damage modifier remove content_lock.no_attack
#execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s gravity modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s fall_damage_multiplier modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.zombified_piglin_princess.bandit_bringer