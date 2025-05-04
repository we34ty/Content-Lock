execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 200
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 180
execute if entity @s[scores={content_lock.attack_timer=180}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=180}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=180}] at @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run playsound entity.zombie_horse.ambient hostile @a ~ ~ ~ 2 1
execute if entity @s[scores={content_lock.attack_timer=180}] run playsound item.crossbow.loading_middle hostile @a ~ ~ ~ 2 1
execute if entity @s[scores={content_lock.attack_timer=180}] run playsound entity.zombie.ambient hostile @a ~ ~ ~ 0.6 0.7

execute if entity @s[scores={content_lock.attack_timer=160..180}] run rotate @s ~15 0
execute if entity @s[scores={content_lock.attack_timer=160..180}] positioned ~ ~1.5 ~ run particle small_flame ^ ^ ^2 0.2 0.2 0.2 0.04 4 force @a
execute if entity @s[scores={content_lock.attack_timer=120..159}] run rotate @s ~35 0
execute if entity @s[scores={content_lock.attack_timer=120..159}] positioned ~ ~1.5 ~ run particle soul_fire_flame ^ ^ ^2 0.2 0.2 0.2 0.04 10 force @a
execute if entity @s[scores={content_lock.attack_timer=120..159}] positioned ~ ~1.5 ~ positioned ^ ^ ^2 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=120..159}] positioned ~ ~1.5 ~ run particle soul_fire_flame ^ ^ ^4 0.2 0.2 0.2 0.04 10 force @a
execute if entity @s[scores={content_lock.attack_timer=120..159}] positioned ~ ~1.5 ~ positioned ^ ^ ^4 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:mob_attack}

execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=120}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=120}] run tag @s remove content_lock.death_rider.spin_around