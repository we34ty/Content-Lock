execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 240
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 160
execute if entity @s[scores={content_lock.attack_timer=160}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest] run summon area_effect_cloud ~ ~ ~ {Duration:61,Tags:[content_lock.enchanted_witch.teleport_away.area],custom_particle:{type:"block",block_state:"air"}}
execute if entity @s[scores={content_lock.attack_timer=160}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest] as @e[tag=content_lock.enchanted_witch.teleport_away.area,limit=1,sort=nearest] run spreadplayers ~ ~ 20 30 false @s
execute if entity @s[scores={content_lock.attack_timer=160}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=160}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect give @s slowness 3 2 true
execute if entity @s[scores={content_lock.attack_timer=160}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect give @s jump_boost 3 5 true
execute if entity @s[scores={content_lock.attack_timer=160}] run particle soul_fire_flame ~ ~ ~ 0 0 0 1 800 force @a
execute if entity @s[scores={content_lock.attack_timer=140}] run particle soul_fire_flame ~ ~ ~ 0 0 0 1 800 force @a
execute if entity @s[scores={content_lock.attack_timer=120}] run particle soul_fire_flame ~ ~ ~ 0 0 0 1 800 force @a

execute if entity @s[scores={content_lock.attack_timer=160}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect give @s resistance 1 4 true
execute if entity @s[scores={content_lock.attack_timer=160}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run damage @s 1 mob_attack by @e[tag=content_lock.enchanted_witch,limit=1]
execute if entity @s[scores={content_lock.attack_timer=159}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect clear @s resistance
execute if entity @s[scores={content_lock.attack_timer=140}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect give @s resistance 1 4 true
execute if entity @s[scores={content_lock.attack_timer=140}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run damage @s 1 mob_attack by @e[tag=content_lock.enchanted_witch,limit=1]
execute if entity @s[scores={content_lock.attack_timer=139}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect clear @s resistance
execute if entity @s[scores={content_lock.attack_timer=120}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect give @s resistance 1 4 true
execute if entity @s[scores={content_lock.attack_timer=120}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run damage @s 1 mob_attack by @e[tag=content_lock.enchanted_witch,limit=1]
execute if entity @s[scores={content_lock.attack_timer=119}] positioned ~-7 ~-7 ~-7 as @e[type=#minecraft:boss_can_damage,dx=14,dy=14,dz=14] run effect clear @s resistance
execute if entity @s[scores={content_lock.attack_timer=100..}] run data merge entity @s {Fire:0s}
execute if entity @s[scores={content_lock.attack_timer=100..}] run effect clear @s wither
execute if entity @s[scores={content_lock.attack_timer=100..}] run effect clear @s poison
execute if entity @s[scores={content_lock.attack_timer=100..},nbt={HurtTime:10s}] run scoreboard players set @s content_lock.attack_timer 100
execute if entity @s[scores={content_lock.attack_timer=100..}] run particle dust{color:[0.867, 0.114, 0.894],scale: 2} ~ ~ ~ 0.3 1.6 0.3 1 40 force @a
execute if entity @s[scores={content_lock.attack_timer=100..}] at @e[tag=content_lock.enchanted_witch.teleport_away.area] run particle dust{color:[0.867, 0.114, 0.894],scale: 2} ~ ~10 ~ 0.3 10 0.3 1 200 force @a
execute if entity @s[scores={content_lock.attack_timer=101}] run tp @s @e[tag=content_lock.enchanted_witch.teleport_away.area,limit=1,sort=nearest]
execute if entity @s[scores={content_lock.attack_timer=100}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s remove content_lock.enchanted_witch.teleport_away