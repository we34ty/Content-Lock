execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 220
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 140

execute if entity @s[scores={content_lock.attack_timer=140}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=140}] run rotate @s ~ 75
execute if entity @s[scores={content_lock.attack_timer=140}] run playsound entity.wither.spawn hostile @a ~ ~ ~ 4 0.2

execute if entity @s[scores={content_lock.attack_timer=40..140},nbt={HurtTime:1s}] run stopsound @a hostile entity.wither.spawn
execute if entity @s[scores={content_lock.attack_timer=40..140},nbt={HurtTime:1s}] run particle soul_fire_flame ~ ~2 ~ 0 0 0 0.2 100 normal @a
execute if entity @s[scores={content_lock.attack_timer=40..140},nbt={HurtTime:1s}] run tag @s remove content_lock.wither.charging_explosion_big_buff
execute if entity @s[scores={content_lock.attack_timer=40..140}] run particle dust{color:5395026,scale:2} ~ ~2 ~ 1 2 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=40..140}] run particle dust{color:2566283,scale:2} ~ ~2 ~ 1 2 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=40..140}] run particle enchant ~ ~2 ~ 1 2 1 1 10 normal @a

execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.wither.spawn hostile @a ~ ~ ~ 4 2
execute if entity @s[scores={content_lock.attack_timer=40}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:5,distance:10,damage:12,damage_type:explosion}
execute if entity @s[scores={content_lock.attack_timer=40}] run particle explosion ~ ~2 ~ 5 2 5 1 100 force @a
execute if entity @s[scores={content_lock.attack_timer=40}] run particle soul_fire_flame ~ ~2 ~ 0 0 0 1 100 normal @a
execute if entity @s[scores={content_lock.attack_timer=40}] run scoreboard players add @s content_lock.wither_regen 2 

execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.wither.charging_explosion_big_buff