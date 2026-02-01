execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 120
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100

execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s add content_lock.third_officer.attacking

execute if entity @s[scores={content_lock.attack_timer=100}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^5 run summon item_display ~ ~ ~ {item:{id:"magma_block"},transformation:[-1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f,0f,0f,0f,0f,1f],Tags:["content_lock.third_officer.explode_front.point"]}
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 1.2
execute if entity @s[scores={content_lock.attack_timer=100}] at @n[tag=content_lock.third_officer.explode_front.point] run particle dust{color:16711680,scale:4} ~ ~ ~ 5 5 5 0.05 100 force @a
execute if entity @s[scores={content_lock.attack_timer=90}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=70}] run playsound entity.generic.explode hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=90..100}] as @n[tag=content_lock.third_officer.explode_front.point] at @s run rotate @s ~10 0
execute if entity @s[scores={content_lock.attack_timer=80..89}] as @n[tag=content_lock.third_officer.explode_front.point] at @s run rotate @s ~20 0
execute if entity @s[scores={content_lock.attack_timer=70..79}] as @n[tag=content_lock.third_officer.explode_front.point] at @s run rotate @s ~40 0
execute if entity @s[scores={content_lock.attack_timer=70..100}] facing entity @n[tag=content_lock.third_officer.explode_front.point] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=70..100}] at @n[tag=content_lock.third_officer.explode_front.point] run particle flame ~ ~ ~ 2 2 2 0.05 10 force @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.explode_front.point] run particle dust{color:16738816,scale:2} ~ ~ ~ 5 5 5 0.05 10 force @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.explode_front.point] run particle flame ~ ~ ~ 2 2 2 0.3 50 normal @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.explode_front.point] run function content_lock:mobs/bosses/universal/damage_player_d {damage:10,half_distance:5,distance:10,damage_type:fireball}

execute if entity @s[scores={content_lock.attack_timer=70}] run kill @e[tag=content_lock.third_officer.explode_front.point]
execute if entity @s[scores={content_lock.attack_timer=70}] run tag @s remove content_lock.third_officer.attacking
execute if entity @s[scores={content_lock.attack_timer=70}] run tag @s remove content_lock.third_officer.explode_front