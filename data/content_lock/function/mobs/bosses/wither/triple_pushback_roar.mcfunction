execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 150
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 130

execute if entity @s[scores={content_lock.attack_timer=130}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=130}] run playsound block.portal.travel hostile @a ~ ~ ~ 0.5 2
execute if entity @s[scores={content_lock.attack_timer=100..130}] run particle portal ~ ~2 ~ 0 0 0 1 20 force @a

execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=100}] run particle soul_fire_flame ~ ~2 ~ 0 0 0 0.5 50 force @a
execute if entity @s[scores={content_lock.attack_timer=100}] run particle reverse_portal ~ ~2 ~ 0 0 0 1 50 normal @a
execute if entity @s[scores={content_lock.attack_timer=100}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:4,distance:8,damage:5,damage_type:mob_attack}

execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=80}] run particle soul_fire_flame ~ ~2 ~ 0 0 0 0.8 50 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] run particle reverse_portal ~ ~2 ~ 0 0 0 1 50 normal @a
execute if entity @s[scores={content_lock.attack_timer=80}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:5,distance:10,damage:5,damage_type:mob_attack}

execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=60}] run particle soul_fire_flame ~ ~2 ~ 0 0 0 1 50 force @a
execute if entity @s[scores={content_lock.attack_timer=60}] run particle reverse_portal ~ ~2 ~ 0 0 0 1 50 normal @a
execute if entity @s[scores={content_lock.attack_timer=60}] run scoreboard players set $strength player_motion.api.launch 30000
execute if entity @s[scores={content_lock.attack_timer=60}] positioned ~-6 ~-6 ~-6 as @e[dx=12,dy=12,dz=12,type=#boss_can_damage] at @s facing entity @n[type=wither] feet rotated ~180 -30 run function player_motion:api/launch_looking


execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.wither.triple_pushback_roar