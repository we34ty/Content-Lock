execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 230
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 200

execute if entity @s[scores={content_lock.attack_timer=200}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=200}] facing entity @n[tag=content_lock.im_a_target] eyes run rotate @s ~ 0
execute if entity @s[scores={content_lock.attack_timer=200}] run scoreboard players set @s content_lock.boss.temp1 -5
execute if entity @s[scores={content_lock.attack_timer=200}] run scoreboard players set @s content_lock.boss.temp2 0
execute if entity @s[scores={content_lock.attack_timer=200}] run data merge storage content_lock:saved_stats {x:0,y:0}
execute if entity @s[scores={content_lock.attack_timer=156..199}] store result storage content_lock:saved_stats x int 1 run scoreboard players get @s content_lock.boss.temp1
execute if entity @s[scores={content_lock.attack_timer=156..199}] store result storage content_lock:saved_stats y int 1 run scoreboard players get @s content_lock.boss.temp2
execute if entity @s[scores={content_lock.attack_timer=156..199}] run function content_lock:mobs/bosses/wither/projectile_barrage_wall_set_wall with storage content_lock:saved_stats
execute if entity @s[scores={content_lock.attack_timer=156..199}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 0.5 1.5
execute if entity @s[scores={content_lock.attack_timer=150}] positioned ~ ~2 ~ facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=10..140}] as @e[tag=content_lock.wither.projectile_barrage_wall.projectile] at @s run function content_lock:mobs/bosses/wither/projectile_barrage_wall_projectile
execute if entity @s[scores={content_lock.attack_timer=10}] run kill @e[tag=content_lock.wither.projectile_barrage_wall.projectile]
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.wither.projectile_barrage_wall