execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 130
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120
execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=100..120}] run particle flame ~ ~3 ~ 0.2 0.2 0.2 0.1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=100..120}] run playsound item.firecharge.use hostile @a ~ ~ ~ 5 1
execute if entity @s[scores={content_lock.attack_timer=100}] facing entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] eyes run summon area_effect_cloud ~ ~3 ~ {Duration:80,Tags:["content_lock.zombified_piglin_princess.fireball.area"],Radius:0.0f}
execute if entity @s[scores={content_lock.attack_timer=20..100}] as @e[tag=content_lock.zombified_piglin_princess.fireball.area] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/fireball_area

execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.zombified_piglin_princess.fireball