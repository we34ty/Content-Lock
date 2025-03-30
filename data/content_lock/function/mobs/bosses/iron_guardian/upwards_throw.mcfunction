execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 115
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100
execute if entity @s[scores={content_lock.attack_timer=100}] run data merge entity @s {NoAI:1b} 
execute if entity @s[scores={content_lock.attack_timer=100}] facing entity @p feet rotated ~ 90 run tp @s ~ ~ ~ ~ ~
particle dust{color:[1, 0, 0],scale: 1} ~ ~ ~ 3.5 1 3.5 1 100 force @a
execute if entity @s[scores={content_lock.attack_timer=60}] run effect give @a[distance=0..7] levitation 1 14 true
execute if entity @s[scores={content_lock.attack_timer=60}] run data merge entity @s {NoAI:0b} 
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.upwards_throw
