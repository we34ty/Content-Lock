tag @s add content_lock.zombified_piglin_princess.phase2
data merge entity @s {NoAI:0b}
scoreboard players set @s content_lock.attack_timer 100
playsound block.end_portal.spawn hostile @a ~ ~ ~ 10 2
particle soul ~ ~1.5 ~ 0 0 0 1 140 normal @a
effect clear @s resistance