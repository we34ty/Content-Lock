execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 240
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.attack_timer 180
execute if entity @s[scores={content_lock.attack_timer=180}] at @p run summon area_effect_cloud ~ ~2 ~ {Duration:21,Tags:[content_lock.enchanted_witch_quick_laser_aim]}
execute if entity @s[scores={content_lock.attack_timer=170..180}] run particle electric_spark ~ ~2.4 ~ 0.4 0.4 0.4 0 100 force @a
execute if entity @s[scores={content_lock.attack_timer=180}] at @a run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=170}] at @a run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=170}] positioned ~ ~2 ~ facing entity @e[tag=content_lock.enchanted_witch_quick_laser_aim,limit=1,sort=nearest] feet run function content_lock:mobs/bosses/enchanted_witch/quick_laser_raycast
execute if entity @s[scores={content_lock.attack_timer=170}] run tag @s remove content_lock.quick_laser