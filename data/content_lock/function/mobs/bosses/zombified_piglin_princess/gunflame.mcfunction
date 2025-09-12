execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.combo_counter 0
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 65
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 60
execute if entity @s[scores={content_lock.attack_timer=60}] run scoreboard players add @s content_lock.combo_counter 1
execute if entity @s[scores={content_lock.attack_timer=60}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=60}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=50}] facing entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#boss_can_damage] feet positioned ^ ^ ^20 run summon area_effect_cloud ~ ~ ~ {Duration:41,Tags:["content_lock.zombified_piglin_princess.gunflame.area.point"],custom_particle:{type:"block",block_state:"air"}}
execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.zombified_piglin.hurt hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={content_lock.attack_timer=50}] run playsound entity.zombified_piglin.hurt hostile @a ~ ~ ~ 1 1.2
execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.breeze.shoot hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={content_lock.attack_timer=40}] run summon area_effect_cloud ~ ~ ~ {Duration:21,Tags:["content_lock.zombified_piglin_princess.gunflame.area.attack"],custom_particle:{type:"block",block_state:"air"}}
execute if entity @s[scores={content_lock.attack_timer=20..40}] as @e[tag=content_lock.zombified_piglin_princess.gunflame.area.attack] at @s facing entity @e[tag=content_lock.zombified_piglin_princess.gunflame.area.point,limit=1,sort=nearest] feet rotated ~ 0 if block ^ ^ ^0.42 #minecraft:walkable run tp @s ^ ^ ^0.42
execute if entity @s[scores={content_lock.attack_timer=20..40}] as @e[tag=content_lock.zombified_piglin_princess.gunflame.area.attack] at @s facing entity @e[tag=content_lock.zombified_piglin_princess.gunflame.area.point,limit=1,sort=nearest] feet rotated ~ 0 unless block ^ ^ ^0.42 #minecraft:walkable run tp @s ^ ^1 ^0.42
execute if entity @s[scores={content_lock.attack_timer=20..40}] as @e[tag=content_lock.zombified_piglin_princess.gunflame.area.attack] at @s run particle flame ~ ~ ~ 0.5 0.5 0.5 0.02 10 force @a
execute if entity @s[scores={content_lock.attack_timer=20..40}] as @e[tag=content_lock.zombified_piglin_princess.gunflame.area.attack] at @s run playsound block.furnace.fire_crackle hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={content_lock.attack_timer=20..40}] as @e[tag=content_lock.zombified_piglin_princess.gunflame.area.attack] at @s run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:2,distance:4,damage:6,damage_type:in_fire}

#execute if entity @s[scores={content_lock.attack_timer=20}] unless score @s content_lock.combo_counter matches 4.. if entity @e[tag=content_lock.im_a_target,type=#minecraft:boss_can_damage] positioned ~-4 ~-4 ~-4 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=8,dy=8,dz=8] run scoreboard players set @s content_lock.attack_timer 110
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.zombified_piglin_princess.gunflame