execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.combo_counter 0
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 240
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 200
execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=200}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=200}] run data merge entity @s {NoAI:1b}

execute if entity @s[scores={content_lock.attack_timer=200}] run playsound entity.zoglin.hurt hostile @a ~ ~ ~ 3 0.8
execute if entity @s[scores={content_lock.attack_timer=180..200}] run rotate @s ~-36 ~
execute if entity @s[scores={content_lock.attack_timer=180..200}] positioned ~ ~2 ~ positioned ^ ^ ^2 run particle flame ~ ~ ~ 0.1 0.1 0.1 0.2 6 force
execute if entity @s[scores={content_lock.attack_timer=180}] run data merge entity @s {NoAI:0b}

execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] run summon area_effect_cloud ~ ~1 ~ {Duration:21,Tags:["content_lock.zombified_piglin_princess.laser.begin_area"],Radius:0.0f}
execute if entity @s[scores={content_lock.attack_timer=180}] run summon area_effect_cloud ~ ~2 ~ {Duration:61,Tags:["content_lock.zombified_piglin_princess.laser.area"],Radius:0.0f}
execute if entity @s[scores={content_lock.attack_timer=180}] as @e[tag=content_lock.zombified_piglin_princess.laser.area,limit=1,sort=nearest] at @s facing entity @e[tag=content_lock.zombified_piglin_princess.laser.begin_area] eyes run rotate @s ~ ~

execute if entity @s[scores={content_lock.attack_timer=120..179}] as @e[tag=content_lock.zombified_piglin_princess.laser.area] at @s run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.zombified_piglin_princess.laser.area.direction],Radius:0.0f}
execute if entity @s[scores={content_lock.attack_timer=120..179}] as @e[tag=content_lock.zombified_piglin_princess.laser.area] at @s run execute as @e[tag=content_lock.zombified_piglin_princess.laser.area.direction,limit=1,sort=nearest] at @s facing entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] eyes run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=120..179}] as @e[tag=content_lock.zombified_piglin_princess.laser.area] at @s run execute anchored eyes rotated as @e[tag=content_lock.zombified_piglin_princess.laser.area.direction,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=120..180}] as @e[tag=content_lock.zombified_piglin_princess.laser.area] run scoreboard players set @s content_lock.temp1 0
execute if entity @s[scores={content_lock.attack_timer=120..180}] as @e[tag=content_lock.zombified_piglin_princess.laser.area] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/laser_shoot

execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s movement_speed modifier remove content_lock.no_speed

execute if entity @s[scores={content_lock.attack_timer=120}] if entity @e[tag=content_lock.im_a_target,type=#minecraft:boss_can_damage] positioned ~-8 ~-8 ~-8 unless entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=16,dy=16,dz=16] run scoreboard players set @s content_lock.attack_timer 10
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.zombified_piglin_princess.laser