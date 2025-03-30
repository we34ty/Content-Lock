execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 115
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100
execute if entity @s[scores={content_lock.attack_timer=100}] at @a[distance=0..7] run summon area_effect_cloud ~ ~ ~ {Duration:41,Tags:[content_lock.enchanted_witch_flame]}
execute if entity @s[scores={content_lock.attack_timer=100}] at @a[distance=0..7] run playsound item.firecharge.use hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=90..100}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run particle small_flame ~ ~ ~ 0.1 0.2 0.1 0.04 10 force @a 
execute if entity @s[scores={content_lock.attack_timer=80..89}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run particle small_flame ~ ~ ~ 0.3 0.5 0.3 0.04 20 force @a 
execute if entity @s[scores={content_lock.attack_timer=61..79}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run particle small_flame ~ ~ ~ 0.5 0.7 0.5 0.04 40 force @a 
execute if entity @s[scores={content_lock.attack_timer=61..100}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run playsound block.fire.ambient hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run particle flame ~ ~ ~ 0 0 0 1 200 force @a
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 0.7
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] run playsound entity.generic.explode hostile @a ~ ~ ~ 0.7 1.3
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.enchanted_witch_flame,distance=0..40] as @a[distance=0..4] run damage @s 14 fireball by @e[tag=content_lock.enchanted_witch,limit=1]

execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.control_flames