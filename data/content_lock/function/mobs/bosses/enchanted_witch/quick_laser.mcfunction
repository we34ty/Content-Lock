execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 240
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.attack_timer 180
execute if entity @s[scores={content_lock.attack_timer=180}] at @e[type=#minecraft:boss_can_damage,tag=content_lock.im_a_target,limit=1,sort=nearest] run summon area_effect_cloud ~ ~2 ~ {Duration:21,Tags:[content_lock.enchanted_witch.quick_laser.area],custom_particle:{type:"block",block_state:"air"}}
execute if entity @s[scores={content_lock.attack_timer=160..180}] run particle electric_spark ~ ~2.4 ~ 0.4 0.4 0.4 0 100 force @a
execute if entity @s[scores={content_lock.attack_timer=180}] at @a run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=160}] at @a run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=160}] positioned ~ ~2 ~ facing entity @e[tag=content_lock.enchanted_witch.quick_laser.area,limit=1,sort=nearest] feet run function content_lock:mobs/bosses/enchanted_witch/quick_laser_raycast
execute if entity @s[scores={content_lock.attack_timer=160}] run tag @s remove content_lock.enchanted_witch.quick_laser