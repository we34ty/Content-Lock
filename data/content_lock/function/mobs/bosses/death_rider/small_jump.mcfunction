execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 115
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 80
execute if entity @s[scores={content_lock.attack_timer=80}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=80}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=70..80}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run particle block{block_state:dirt} ~ ~ ~ 0.3 0.3 0.3 1 6 normal
execute if entity @s[scores={content_lock.attack_timer=80}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run playsound entity.horse.angry hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={content_lock.attack_timer=69}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run playsound entity.horse.jump hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={content_lock.attack_timer=69}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run data merge entity @s {Motion:[0.0d,0.8d,0.0d]}
execute if entity @s[scores={content_lock.attack_timer=..64}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] if entity @s[nbt={OnGround:1b}] run scoreboard players set @e[tag=content_lock.death_rider,limit=1,sort=nearest] content_lock.attack_timer 40

execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run playsound minecraft:entity.dragon_fireball.explode hostile @a ~ ~ ~ 1 0.1
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run particle soul_fire_flame ~ ~ ~ 0 0 0 0.7 60 normal @a
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:4,distance:8,damage:8,damage_type:player_explosion}
execute if entity @s[scores={content_lock.attack_timer=40}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=40}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.death_rider.small_jump