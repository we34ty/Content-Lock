execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 90
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 80

execute if entity @s[scores={content_lock.attack_timer=80}] at @e[type=#boss_can_damage,distance=..10] run summon marker ~ ~5 ~ {Tags:["content_lock.wither.crush_from_above_all.pointer"]}
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.6

execute if entity @s[scores={content_lock.attack_timer=20..80}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run particle block_crumble{block_state:anvil} ~ ~ ~ 1 1 1 1 10 force @a
execute if entity @s[scores={content_lock.attack_timer=20..80}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run particle dust{color:3289655,scale:2} ~ ~ ~ 1 1 1 1 3 force @a

execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run playsound entity.iron_golem.damage hostile @a ~ ~ ~ 1 0.6
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run particle dust{color:3289655,scale:3} ~ ~-2.5 ~ 1 5 1 1 50 force @a
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run particle dust{color:3289655,scale:3} ~ ~-2.5 ~ 1 5 1 1 150 normal @a
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] positioned ~ ~-2.5 ~ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:8,damage_type:falling_block}
execute if entity @s[scores={content_lock.attack_timer=60}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] positioned ~ ~-5 ~ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:8,damage_type:falling_block}

execute if entity @s[scores={content_lock.attack_timer=40}] run kill @e[tag=content_lock.wither.crush_from_above_all.pointer]
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[type=#boss_can_damage,distance=..10] run summon marker ~ ~5 ~ {Tags:["content_lock.wither.crush_from_above_all.pointer"]}
execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.6

execute if entity @s[scores={content_lock.attack_timer=20}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run playsound entity.iron_golem.damage hostile @a ~ ~ ~ 1 0.6
execute if entity @s[scores={content_lock.attack_timer=20}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run particle dust{color:3289655,scale:3} ~ ~-2.5 ~ 1 5 1 1 50 force @a
execute if entity @s[scores={content_lock.attack_timer=20}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] run particle dust{color:3289655,scale:3} ~ ~-2.5 ~ 1 5 1 1 150 normal @a
execute if entity @s[scores={content_lock.attack_timer=20}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] positioned ~ ~-2.5 ~ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:8,damage_type:falling_block}
execute if entity @s[scores={content_lock.attack_timer=20}] at @e[tag=content_lock.wither.crush_from_above_all.pointer] positioned ~ ~-5 ~ run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:8,damage_type:falling_block}

execute if entity @s[scores={content_lock.attack_timer=20}] run kill @e[tag=content_lock.wither.crush_from_above_all.pointer]
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.wither.crush_from_above_all