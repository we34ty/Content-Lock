execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 170
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120

execute if entity @s[scores={content_lock.attack_timer=120}] run tag @s add content_lock.third_officer.attacking

execute if entity @s[scores={content_lock.attack_timer=110}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 1.2
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 1.6
execute if entity @s[scores={content_lock.attack_timer=90}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=90..110}] run particle soul_fire_flame ~ ~ ~ 3 3 3 0.05 20 normal @a
execute if entity @s[scores={content_lock.attack_timer=90..110}] run particle dust{color:2009058,scale:2} ~ ~ ~ 3 3 3 0.05 20 force @a
execute if entity @s[scores={content_lock.attack_timer=90..110}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=91}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^2 run summon item_display ~ ~ ~ {item:{id:"warped_hyphae"},transformation:[-1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f,0f,0f,0f,0f,1f],Tags:["content_lock.third_officer.fireball.projectile","content_lock.third_officer.fireball.projectile.blue"]}
execute if entity @s[scores={content_lock.attack_timer=91}] as @n[tag=content_lock.third_officer.fireball.projectile] at @s facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=90}] facing entity @n[tag=content_lock.im_a_target] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=90}] at @n[tag=content_lock.im_a_target] run particle dust{color:16711680,scale:1} ~ ~0.5 ~ 1.5 1.5 1.5 0.05 20 force @a

execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 1.6
execute if entity @s[scores={content_lock.attack_timer=70}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=70..80}] run particle soul_fire_flame ~ ~ ~ 3 3 3 0.05 20 normal @a
execute if entity @s[scores={content_lock.attack_timer=70..80}] run particle dust{color:2009058,scale:2} ~ ~ ~ 3 3 3 0.05 20 force @a
execute if entity @s[scores={content_lock.attack_timer=70..80}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=71}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^2 run summon item_display ~ ~ ~ {item:{id:"warped_hyphae"},transformation:[-1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f,0f,0f,0f,0f,1f],Tags:["content_lock.third_officer.fireball.projectile","content_lock.third_officer.fireball.projectile.blue"]}
execute if entity @s[scores={content_lock.attack_timer=71}] as @n[tag=content_lock.third_officer.fireball.projectile] at @s facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=70}] facing entity @n[tag=content_lock.im_a_target] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.im_a_target] run particle dust{color:16711680,scale:1} ~ ~0.5 ~ 1.5 1.5 1.5 0.05 20 force @a

execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 1.6
execute if entity @s[scores={content_lock.attack_timer=50}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=50..60}] run particle soul_fire_flame ~ ~ ~ 3 3 3 0.05 20 normal @a
execute if entity @s[scores={content_lock.attack_timer=50..60}] run particle dust{color:2009058,scale:2} ~ ~ ~ 3 3 3 0.05 20 force @a
execute if entity @s[scores={content_lock.attack_timer=50..60}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=51}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^2 run summon item_display ~ ~ ~ {item:{id:"warped_hyphae"},transformation:[-1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f,0f,0f,0f,0f,1f],Tags:["content_lock.third_officer.fireball.projectile","content_lock.third_officer.fireball.projectile.blue"]}
execute if entity @s[scores={content_lock.attack_timer=51}] as @n[tag=content_lock.third_officer.fireball.projectile] at @s facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=50}] facing entity @n[tag=content_lock.im_a_target] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=50}] at @n[tag=content_lock.im_a_target] run particle dust{color:16711680,scale:1} ~ ~0.5 ~ 1.5 1.5 1.5 0.05 20 force @a


execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.third_officer.attacking
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.third_officer.blue_fireball