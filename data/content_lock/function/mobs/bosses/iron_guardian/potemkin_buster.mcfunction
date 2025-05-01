execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 280
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 230
execute if entity @s[scores={content_lock.attack_timer=230}] run data merge entity @s {NoAI:1b} 
execute if entity @s[scores={content_lock.attack_timer=230}] facing entity @p feet rotated ~ 0 run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={content_lock.attack_timer=230}] run playsound entity.iron_golem.attack hostile @a ~ ~ ~ 1 0.7
execute if entity @s[scores={content_lock.attack_timer=191..230}] run particle dust{color:[1, 0, 0],scale: 1} ^ ^ ^3 3 1 3 1 50 force @a
execute if entity @s[scores={content_lock.attack_timer=190}] positioned ^ ^ ^3 positioned ~-3 ~-1 ~-3 as @e[type=#minecraft:boss_can_damage,dx=6,dy=6,dz=6] run tag @s add content_lock.caught_in_potemkin_buster
execute if entity @s[scores={content_lock.attack_timer=190}] run tp @s ~ ~ ~ ~ -90
execute if entity @s[scores={content_lock.attack_timer=149..189}] run tp @s ~ ~0.6 ~
execute if entity @s[scores={content_lock.attack_timer=110..189}] run tp @a[tag=content_lock.caught_in_potemkin_buster,distance=0..12] ~ ~2 ~
execute if entity @s[scores={content_lock.attack_timer=..189}] run effect give @a[tag=content_lock.caught_in_potemkin_buster,distance=0..12] slow_falling 1 0 true
execute if entity @s[scores={content_lock.attack_timer=121..130}] run tp @s ~ ~-2.4 ~
execute if entity @s[scores={content_lock.attack_timer=110}] as @a[tag=content_lock.caught_in_potemkin_buster,distance=0..12] run damage @s 6 fall by @e[tag=content_lock.iron_guardian.potemkin_buster,limit=1]
execute if entity @s[scores={content_lock.attack_timer=110}] as @a[tag=!content_lock.caught_in_potemkin_buster,distance=0..5] run damage @s 3 explosion by @e[tag=content_lock.iron_guardian.potemkin_buster,limit=1]
execute if entity @s[scores={content_lock.attack_timer=110}] run particle explosion ~ ~ ~ 0 0 0 1 1 force @a
execute if entity @s[scores={content_lock.attack_timer=110}] run playsound entity.generic.explode hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=110..190}] run effect give @s resistance 1 255
execute if entity @s[scores={content_lock.attack_timer=100}] run data merge entity @s {NoAI:0b} 
execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s remove content_lock.iron_guardian.potemkin_buster
execute if entity @s[scores={content_lock.attack_timer=100}] run tag @a remove content_lock.caught_in_potemkin_buster