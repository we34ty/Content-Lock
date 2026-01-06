execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 110
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 80

execute if entity @s[scores={content_lock.attack_timer=80}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=80}] run rotate @s ~ 75
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.wither.spawn hostile @a ~ ~ ~ 4 0.6

execute if entity @s[scores={content_lock.attack_timer=20..80}] run particle dust{color:4792122,scale:2} ~ ~2 ~ 1 2 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=20..80}] run particle dust{color:2256329,scale:2} ~ ~2 ~ 1 2 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=20..80}] run particle enchant ~ ~2 ~ 1 2 1 1 10 normal @a

execute if entity @s[scores={content_lock.attack_timer=20}] run playsound entity.wither.spawn hostile @a ~ ~ ~ 4 2
execute if entity @s[scores={content_lock.attack_timer=20}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:5,distance:10,damage:8,damage_type:explosion}
execute if entity @s[scores={content_lock.attack_timer=20}] run particle explosion ~ ~2 ~ 5 2 5 1 100 force @a
execute if entity @s[scores={content_lock.attack_timer=20}] run particle soul_fire_flame ~ ~2 ~ 0 0 0 1 100 normal @a

execute if entity @s[scores={content_lock.attack_timer=0}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.wither.charging_explosion