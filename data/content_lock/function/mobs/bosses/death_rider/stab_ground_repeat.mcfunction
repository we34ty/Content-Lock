execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 150
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 150
execute if entity @s[scores={content_lock.attack_timer=149}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=149}] run data merge entity @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=148}] facing entity @p feet run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={content_lock.attack_timer=148}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={content_lock.attack_timer=88..148}] run particle angry_villager ~ ~2 ~ 0.2 0.2 0.2 1 4 force @a 
execute if entity @s[scores={content_lock.attack_timer=88..148}] run particle dust{color:[0.0, 0.345, 0.047],scale: 1} ~ ~ ~ 3 0.1 3 1 30 force @a
execute if entity @s[scores={content_lock.attack_timer=148}] run playsound entity.zombie.break_wooden_door hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={content_lock.attack_timer=118}] run playsound entity.zombie.break_wooden_door hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={content_lock.attack_timer=88}] run playsound entity.zombie.break_wooden_door hostile @a ~ ~ ~ 1 0.8
execute if entity @s[scores={content_lock.attack_timer=87}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 2 1.5
execute if entity @s[scores={content_lock.attack_timer=87}] run particle soul ~ ~ ~ 0 0 0 1 500 force @a
execute if entity @s[scores={content_lock.attack_timer=87}] as @a[distance=0..6] run damage @s 10 mob_attack by @e[tag=content_lock.death_rider,limit=1]
execute if entity @s[scores={content_lock.attack_timer=119}] run scoreboard players add @s content_lock.boss_exhaustion 45
execute if entity @s[scores={content_lock.attack_timer=87}] if predicate content_lock:true_random unless score @s content_lock.boss_exhaustion matches 300.. run scoreboard players set @s content_lock.attack_timer 120
execute if entity @s[scores={content_lock.attack_timer=87}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=87}] run data merge entity @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=87}] run tag @s remove content_lock.stab_ground_repeat