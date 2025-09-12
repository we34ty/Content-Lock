execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 210
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 170
execute if entity @s[scores={content_lock.attack_timer=170}] run data merge entity @s {NoAI:1b} 
execute if entity @s[scores={content_lock.attack_timer=150..169}] facing entity @p feet rotated ~ -45 run tp @s ~ ~0.2 ~ ~ ~

#execute if entity @s[scores={content_lock.attack_timer=21..}] run function content_lock:player_passives/parry/projectile_parry_rotate
execute if entity @s[scores={content_lock.attack_timer=..150}] run summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.direction_to_look_for_iron_guardian],custom_particle:{type:"block",block_state:"air"}}
execute if entity @s[scores={content_lock.attack_timer=..150}] as @e[tag=content_lock.direction_to_look_for_iron_guardian,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p
execute if entity @s[scores={content_lock.attack_timer=..150}] anchored eyes rotated as @e[tag=content_lock.direction_to_look_for_iron_guardian,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^50 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~

execute if entity @s[scores={content_lock.attack_timer=..150}] run tp @s ^ ^ ^0.5

execute if entity @s[scores={content_lock.attack_timer=..150}] run execute unless block ~ ~-1 ~ #walkable run scoreboard players set @s content_lock.attack_timer 40
execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.iron_golem.damage hostile @a ~ ~ ~ 1 0.7
execute if entity @s[scores={content_lock.attack_timer=40}] run particle block{block_state:{Name:iron_block}} ~ ~ ~ 2 1 2 1 200 force @a
execute if entity @s[scores={content_lock.attack_timer=40}] at @s run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:3,damage_type:fly_into_wall}
execute if entity @s[scores={content_lock.attack_timer=40}] run data merge entity @s {NoAI:0b} 
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.iron_guardian.jump_towards_player
