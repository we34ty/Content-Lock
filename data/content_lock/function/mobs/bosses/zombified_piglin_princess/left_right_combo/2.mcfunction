execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players add @s content_lock.boss_exhaustion 60

execute if entity @s[scores={content_lock.attack_timer=90..100}] run playsound entity.generic.burn hostile @a ~ ~ ~ 0.3 1.5
execute if entity @s[scores={content_lock.attack_timer=76..90}] run playsound block.furnace.fire_crackle hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={content_lock.attack_timer=90..100}] positioned ~ ~2 ~ positioned ^2 ^ ^ run particle dust{color:14734592,scale:1} ~ ~ ~ 0.2 0.2 0.2 0.5 10 force @a
execute if entity @s[scores={content_lock.attack_timer=90}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={content_lock.attack_timer=90}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=90}] run rotate @s ~-45 ~
execute if entity @s[scores={content_lock.attack_timer=76..89}] run rotate @s ~10 ~
execute if entity @s[scores={content_lock.attack_timer=76..90}] positioned ~ ~2 ~ positioned ^2 ^ ^ run particle crit ~ ~ ~ 0.4 0.4 0.4 0.05 13 force @a
execute if entity @s[scores={content_lock.attack_timer=76..90}] positioned ~ ~2 ~ positioned ^2 ^ ^ run particle sweep_attack ~ ~ ~ 0.4 0.4 0.4 0.05 1 force @a
execute if entity @s[scores={content_lock.attack_timer=76..90}] positioned ~ ~1 ~ positioned ^2 ^ ^ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:6,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=76..90}] positioned ~ ~2 ~ positioned ^4 ^ ^ run particle crit ~ ~ ~ 0.4 0.4 0.4 0.05 13 force @a
execute if entity @s[scores={content_lock.attack_timer=76..90}] positioned ~ ~2 ~ positioned ^4 ^ ^ run particle sweep_attack ~ ~ ~ 0.4 0.4 0.4 0.05 1 force @a
execute if entity @s[scores={content_lock.attack_timer=76..90}] positioned ~ ~1 ~ positioned ^4 ^ ^ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:6,damage_type:mob_attack}
execute if entity @s[scores={content_lock.attack_timer=76}] run data merge entity @s {NoAI:0b}

