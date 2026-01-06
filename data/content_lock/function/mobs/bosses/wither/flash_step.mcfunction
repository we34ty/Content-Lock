execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 150
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100

execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.wither.ambient hostile @a ~ ~ ~ 4 0.5
execute if entity @s[scores={content_lock.attack_timer=100}] run particle crit ~ ~2 ~ 1 2 1 1 50 force @a

execute if entity @s[scores={content_lock.attack_timer=20}] at @n[tag=content_lock.im_a_target] rotated as @n[tag=content_lock.im_a_target] rotated ~ 0 positioned ^ ^ ^2 if block ~ ~2 ~ #walkable facing entity @n[tag=content_lock.im_a_target] eyes run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={content_lock.attack_timer=20}] at @n[tag=content_lock.im_a_target] rotated as @n[tag=content_lock.im_a_target] rotated ~ 0 positioned ^ ^ ^2 unless block ~ ~2 ~ #walkable at @s facing entity @n[tag=content_lock.im_a_target] eyes positioned ^ ^2 ^ run tp @n[tag=content_lock.im_a_target] ~ ~ ~ facing entity @n[type=wither] eyes
execute if entity @s[scores={content_lock.attack_timer=20}] run particle crit ~ ~2 ~ 1 2 1 1 50 force @a
execute if entity @s[scores={content_lock.attack_timer=20}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 4 0.7

execute if entity @s[scores={content_lock.attack_timer=19}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=19}] positioned ~ ~2 ~ facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=19}] run tag @s remove content_lock.wither.flash_step