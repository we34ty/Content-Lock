execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 120
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 80
execute if entity @s[scores={content_lock.attack_timer=80}] at @a[distance=0..7] run summon area_effect_cloud ~ ~ ~ {Duration:41,Tags:[content_lock.enchanted_witch_tazer]}
execute if entity @s[scores={content_lock.attack_timer=40..80}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run particle electric_spark ~ ~ ~ 2.5 2.5 2.5 0 300 force @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 0.5 2
execute if entity @s[scores={content_lock.attack_timer=50}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 0.5 2
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run particle electric_spark ~ ~ ~ 2.5 2.5 2.5 1 600 force @a
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] run particle soul_fire_flame ~ ~ ~ 2.5 2.5 2.5 1 100 force @a
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] as @a[distance=0..5] run damage @s 12 lightning_bolt by @e[tag=content_lock.enchanted_witch,limit=1]
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.enchanted_witch_tazer,distance=0..40] as @a[distance=0..5] run effect give @s slowness 3 1 true
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.taze_attack