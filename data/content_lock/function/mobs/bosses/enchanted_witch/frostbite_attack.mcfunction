execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 240
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.attack_timer=240}] at @a[distance=7.1..40] run summon area_effect_cloud ~ ~ ~ {Duration:91,Tags:[content_lock.enchanted_witch_freezing_point]}
execute if entity @s[scores={content_lock.attack_timer=185..240}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run particle snowflake ~ ~ ~ 1 0.3 1 0.1 20 force @a
execute if entity @s[scores={content_lock.attack_timer=240}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=240}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=240}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=220}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.52
execute if entity @s[scores={content_lock.attack_timer=220}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=220}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.player.hurt_freeze hostile @a ~ ~ ~ 2 0.5

execute if entity @s[scores={content_lock.attack_timer=185..195}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run particle block{block_state:{Name:powder_snow}} ~ ~ ~ 2 0.3 2 1 200 force @a
execute if entity @s[scores={content_lock.attack_timer=195}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.warden.emerge hostile @a ~ ~ ~ 1 2
execute if entity @s[scores={content_lock.attack_timer=185..190}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run playsound entity.warden.nearby_closest hostile @a ~ ~ ~ 1 2

execute if entity @s[scores={content_lock.attack_timer=160}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run particle block{block_state:{Name:powder_snow}} ~ ~ ~ 5 5 5 1 1000 force @a
execute if entity @s[scores={content_lock.attack_timer=160}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run particle snowflake ~ ~ ~ 5 5 5 1 1000 force @a
execute if entity @s[scores={content_lock.attack_timer=160}] at @e[tag=content_lock.enchanted_witch_freezing_point,distance=0..40] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:5,distance:10,damage:12,damage_type:freeze}
execute if entity @s[scores={content_lock.attack_timer=160}] run tag @s remove content_lock.frostbite_attack