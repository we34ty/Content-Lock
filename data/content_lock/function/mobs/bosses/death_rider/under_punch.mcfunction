execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 130
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120

execute if entity @s[scores={content_lock.attack_timer=120}] positioned ~-4 ~-4 ~-4 at @e[dx=8,dz=8,dy=8,type=#boss_can_damage] run summon area_effect_cloud ~ ~ ~ {Duration:60,Tags:["content_lock.death_rider.under_punch.area"]}
execute if entity @s[scores={content_lock.attack_timer=100..120}] at @e[tag=content_lock.death_rider.under_punch.area] run particle soul ~ ~ ~ 0.1 0.1 0.1 0.03 6 force @a
execute if entity @s[scores={content_lock.attack_timer=100..120}] at @e[tag=content_lock.death_rider.under_punch.area] run playsound block.fire.extinguish hostile @a ~ ~ ~ 0.1 2
execute if entity @s[scores={content_lock.attack_timer=60..99}] at @e[tag=content_lock.death_rider.under_punch.area] run particle soul ~ ~2 ~ 0.1 2 0.1 0.03 6 force @a
execute if entity @s[scores={content_lock.attack_timer=60..99}] at @e[tag=content_lock.death_rider.under_punch.area] run particle soul_fire_flame ~ ~2 ~ 0.1 2 0.1 0.1 6 force @a
execute if entity @s[scores={content_lock.attack_timer=60..99}] at @e[tag=content_lock.death_rider.under_punch.area] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 0.4 1
execute if entity @s[scores={content_lock.attack_timer=60..99}] at @e[tag=content_lock.death_rider.under_punch.area] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:6,damage_type:in_fire}

execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.death_rider.under_punch