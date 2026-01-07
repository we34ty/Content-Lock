execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 160
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 140

execute if entity @s[scores={content_lock.attack_timer=140}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=140}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=140}] run particle angry_villager ~ ~4 ~ 1 1 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=130}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=130}] run particle angry_villager ~ ~4 ~ 1 1 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=120}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=120}] run particle angry_villager ~ ~4 ~ 1 1 1 1 10 force @a

execute if entity @s[scores={content_lock.attack_timer=110}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=110}] run tag @s add content_lock.wither.ai.charging_forward
execute if entity @s[scores={content_lock.attack_timer=110}] at @n[tag=content_lock.im_a_target] run summon marker ~ ~ ~ {Tags:["content_lock.wither.ai.charging_forward.pointer"]}
execute if entity @s[scores={content_lock.attack_timer=60..110}] run playsound entity.wither.break_block hostile @a ~ ~ ~ 0.3 1.7
execute if entity @s[scores={content_lock.attack_timer=60..110}] run particle dust{color:4276551,scale:2} ~ ~2 ~ 1 1 1 1 20 normal @a
execute if entity @s[scores={content_lock.attack_timer=60..110}] run particle block_crumble{block_state:stone} ~ ~2 ~ 1 1 1 1 20 normal @a
execute if entity @s[scores={content_lock.attack_timer=60..110}] run particle block{block_state:dirt} ~ ~ ~ 1 0.2 1 1 10 normal @a
execute if entity @s[scores={content_lock.attack_timer=60..110}] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:6,damage_type:mob_attack}

execute if entity @s[scores={content_lock.attack_timer=60}] run kill @e[tag=content_lock.wither.ai.charging_forward.pointer]
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.wither.ai.charging_forward
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.wither.charge_forward