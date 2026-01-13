execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 80
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 60

execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 1 1.2
execute if entity @s[scores={content_lock.attack_timer=50}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 1 1.6
execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=40..60}] run particle flame ~ ~ ~ 3 3 3 0.05 20 normal @a
execute if entity @s[scores={content_lock.attack_timer=40..60}] run particle dust{color:16738816,scale:2} ~ ~ ~ 3 3 3 0.05 20 force @a
execute if entity @s[scores={content_lock.attack_timer=40..60}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=41}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^2 run summon item_display ~ ~ ~ {item:{id:"magma_block"},transformation:[-1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f,0f,0f,0f,0f,1f],Tags:["content_lock.third_officer.fireball.projectile"]}
execute if entity @s[scores={content_lock.attack_timer=40}] as @n[tag=content_lock.third_officer.fireball.projectile] at @s facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~


execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.third_officer.fireball