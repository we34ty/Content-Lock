execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 160
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120

execute if entity @s[scores={content_lock.attack_timer=120}] run tag @s add content_lock.third_officer.attacking

execute if entity @s[scores={content_lock.attack_timer=120}] run playsound block.beacon.activate hostile @a ~ ~ ~ 4 1.2
execute if entity @s[scores={content_lock.attack_timer=110..111}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=110}] at @n[tag=content_lock.im_a_target] run summon marker ~ ~0.5 ~ {Tags:["content_lock.third_officer.blue_laser.target"]}
execute if entity @s[scores={content_lock.attack_timer=110}] facing entity @n[tag=content_lock.im_a_target] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=100..120}] run particle dust{color:5570815,scale:2} ~ ~ ~ 3 3 3 0.05 20 force @a
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 4 0.7
execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players set @s content_lock.temp1 0
execute if entity @s[scores={content_lock.attack_timer=100..101}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=100}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] eyes positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_laser_raycast

execute if entity @s[scores={content_lock.attack_timer=91}] run tag @e remove content_lock.im_a_target.temp 
execute if entity @s[scores={content_lock.attack_timer=91}] unless entity @n[type=#content_lock:boss_can_damage,distance=..20] run tag @n[tag=content_lock.im_a_target] remove content_lock.im_a_target.temp 
execute if entity @s[scores={content_lock.attack_timer=91}] if entity @e[type=#content_lock:boss_can_damage,distance=..20] run tag @e[type=#content_lock:boss_can_damage,distance=..20,limit=1,sort=random] add content_lock.im_a_target.temp

execute if entity @s[scores={content_lock.attack_timer=90..91}] facing entity @n[tag=content_lock.im_a_target.temp] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=90}] at @n[tag=content_lock.im_a_target.temp] run summon marker ~ ~0.5 ~ {Tags:["content_lock.third_officer.blue_laser.target"]}
execute if entity @s[scores={content_lock.attack_timer=90}] facing entity @n[tag=content_lock.im_a_target.temp] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 4 0.7
execute if entity @s[scores={content_lock.attack_timer=80}] run scoreboard players set @s content_lock.temp1 0
execute if entity @s[scores={content_lock.attack_timer=80..81}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=80}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] eyes positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_laser_raycast

execute if entity @s[scores={content_lock.attack_timer=71}] run tag @e remove content_lock.im_a_target.temp 
execute if entity @s[scores={content_lock.attack_timer=71}] unless entity @n[type=#content_lock:boss_can_damage,distance=..20] run tag @n[tag=content_lock.im_a_target] remove content_lock.im_a_target.temp 
execute if entity @s[scores={content_lock.attack_timer=71}] if entity @e[type=#content_lock:boss_can_damage,distance=..20] run tag @e[type=#content_lock:boss_can_damage,distance=..20,limit=1,sort=random] add content_lock.im_a_target.temp

execute if entity @s[scores={content_lock.attack_timer=70..71}] facing entity @n[tag=content_lock.im_a_target.temp] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.im_a_target.temp] run summon marker ~ ~0.5 ~ {Tags:["content_lock.third_officer.blue_laser.target"]}
execute if entity @s[scores={content_lock.attack_timer=70}] facing entity @n[tag=content_lock.im_a_target.temp] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 4 0.7
execute if entity @s[scores={content_lock.attack_timer=60}] run scoreboard players set @s content_lock.temp1 0
execute if entity @s[scores={content_lock.attack_timer=60..61}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=60}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] eyes positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_laser_raycast

execute if entity @s[scores={content_lock.attack_timer=51}] run tag @e remove content_lock.im_a_target.temp 
execute if entity @s[scores={content_lock.attack_timer=51}] unless entity @n[type=#content_lock:boss_can_damage,distance=..20] run tag @n[tag=content_lock.im_a_target] remove content_lock.im_a_target.temp 
execute if entity @s[scores={content_lock.attack_timer=51}] if entity @e[type=#content_lock:boss_can_damage,distance=..20] run tag @e[type=#content_lock:boss_can_damage,distance=..20,limit=1,sort=random] add content_lock.im_a_target.temp

execute if entity @s[scores={content_lock.attack_timer=50..51}] facing entity @n[tag=content_lock.im_a_target.temp] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=50}] at @n[tag=content_lock.im_a_target.temp] run summon marker ~ ~0.5 ~ {Tags:["content_lock.third_officer.blue_laser.target"]}
execute if entity @s[scores={content_lock.attack_timer=50}] facing entity @n[tag=content_lock.im_a_target.temp] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction
execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 1
execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 4 0.7
execute if entity @s[scores={content_lock.attack_timer=40}] run scoreboard players set @s content_lock.temp1 0
execute if entity @s[scores={content_lock.attack_timer=40..41}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=40}] facing entity @n[type=marker,tag=content_lock.third_officer.blue_laser.target] eyes positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_laser_raycast

execute if entity @s[scores={content_lock.attack_timer=40}] run kill @e[tag=content_lock.third_officer.blue_laser.target]
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.third_officer.attacking
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.third_officer.blue_laser