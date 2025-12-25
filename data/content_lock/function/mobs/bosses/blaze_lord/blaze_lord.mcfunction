#execute if entity @s[tag=summoning_phase] if predicate content_lock:random if predicate content_lock:random run summon minecraft:blaze ~ ~ ~ {CustomName:'[{"text":"Blaze Warden","color":"gold"}]',CustomNameVisible:1b,Health:100,HasVisualFire:1b,Tags:["blaze_warden"],HandItems:[{id:shield,tag:{Unbreakable:1,AttributeModifiers:[{AttributeName:"generic.movement_speed",Amount:-0.2,Operation:2,Name:"generic.movement_speed",UUID:[I;-123622,18249,19834,-36498]},{AttributeName:"generic.armor_toughness",Amount:10,Name:"generic.armor_toughness",UUID:[I;-123622,18349,19834,-36698]},{AttributeName:"generic.armor",Amount:0.2,Operation:1,Name:"generic.armor",UUID:[I;-123622,18449,19834,-36898]},{AttributeName:"generic.knockback_resistance",Amount:1,Name:"generic.knockback_resistance",UUID:[I;-123622,18549,19834,-37098]},{AttributeName:"generic.max_health",Amount:0.2,Operation:1,Name:"generic.max_health",UUID:[I;-123622,18649,19834,-37298]}],display:{Name:'[{"text":"Blaze Warden\'s Shield","italic":false,"color":"gold"}]'}},Count:1},{id:shield,Count:1}],HandDropChances:[0.05f,0.00f],ArmorItems:[{id:shield,Count:1},{id:shield,Count:1},{id:shield,Count:1},{id:shield,Count:1}],ArmorDropChances:[0.00f,0.00f,0.00f,0.00f],Attributes:[{Name:"generic.armor",Base:16f},{Name:"generic.movement_speed",Base:0.4f},{Name:"generic.knockback_resistance",Base:1f},{Name:"generic.attack_knockback",Base:5f},{Name:"generic.attack_damage",Base:10f},{Name:"generic.max_health",Base:100f}]}
execute if entity @s[scores={wither_killed=1..}] run function content_lock:bosses/blaze_lord/monologue

execute if entity @p[distance=0..20] at @a[distance=0..20] unless block ~ ~-1 ~ bedrock unless block ~ ~-1 ~ air unless block ~ ~-1 ~ fire run setblock ~ ~-1 ~ air
execute if entity @p[distance=0..20] at @a[distance=0..20] unless block ~ ~2 ~ air run setblock ~ ~2 ~ air
execute if entity @r[distance=20..40] as @a[distance=20..40] at @s facing entity @e[tag=blaze_lord,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.5
execute if entity @s[scores={timer1=20}] run summon area_effect_cloud ~ ~ ~ {Duration:40,Tags:[to_be_blaze_lord_lightning_struck]}

execute if entity @r[distance=0..20,nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run scoreboard players add @s arrow_damage 1
execute if entity @s[scores={arrow_damage=600..}] run particle flame ~ ~ ~ 20 0 20 1 1000 force
execute if entity @s[scores={arrow_damage=600..}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 1
execute if entity @s[scores={arrow_damage=600..}] run effect clear @a[distance=0..20] fire_resistance
execute if entity @s[scores={arrow_damage=600..}] run scoreboard players set @s arrow_damage 0

scoreboard players set @s momenta_ender_armor_dot 0
scoreboard players set @s[tag=second_phase] offensive_ender_armor_dot 0
scoreboard players set @s[tag=second_phase] ice_hail_stacks 0

execute if entity @s[tag=second_phase] if entity @r[distance=0..20,nbt={HurtTime:9s}] run scoreboard players add @a[distance=0..20,nbt={HurtTime:9s}] ice_hail_stacks 70

execute store result score @s temporary_health_holder run data get entity @s Health
execute store result score @s huhhealth1 run attribute @s generic.max_health get 0.5
execute if entity @s[tag=!second_phase] if score @s temporary_health_holder <= @s huhhealth1 run function content_lock:bosses/blaze_lord/second_phase_transition

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=0..4] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add shields_four_directions
execute if entity @s[tag=shields_four_directions] run function content_lock:bosses/blaze_lord/shields_four_directions

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=0..4] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add three_shields_round
execute if entity @s[tag=three_shields_round] run function content_lock:bosses/blaze_lord/three_shields_round

execute if entity @s[scores={attack_timer=0},tag=second_phase] if entity @p[distance=0..4] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add blue_flame_explosion
execute if entity @s[tag=blue_flame_explosion] run function content_lock:bosses/blaze_lord/blue_flame_explosion

execute if entity @s[scores={attack_timer=0},tag=second_phase] if entity @p[distance=0..4] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add blue_falling_star
execute if entity @s[tag=blue_flame_explosion,scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[tag=blue_flame_explosion,scores={attack_timer=1}] run summon area_effect_cloud ~ ~2 ~ {Duration:80,Tags:[blaze_lord_falling_star]}

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=5..20] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add fire_tornado
execute if entity @s[tag=fire_tornado] run function content_lock:bosses/blaze_lord/fire_tornado

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=7..20] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add three_fireballs
execute if entity @s[tag=three_fireballs] run function content_lock:bosses/blaze_lord/three_fireballs

execute if entity @s[scores={attack_timer=0},tag=second_phase] if entity @p[distance=7..20] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add huge_blue_fireball
execute if entity @s[tag=huge_blue_fireball,scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[tag=huge_blue_fireball,scores={attack_timer=1}] run summon area_effect_cloud ~ ~5 ~ {Duration:200,Tags:[huge_blue_fireball_blaze_lord]}
execute if entity @s[tag=huge_blue_fireball,scores={attack_timer=1}] run tag @s remove huge_blue_fireball

execute if entity @s[scores={attack_timer=0},tag=second_phase] if entity @p[distance=5..20] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add shield_dashed_behind
execute if entity @s[tag=shield_dashed_behind] run function content_lock:bosses/blaze_lord/shield_dashed_behind

execute if entity @s[scores={attack_timer=0},tag=!second_phase] unless entity @e[tag=blaze_warden] if entity @p[distance=7..20] if predicate content_lock:true_random if predicate content_lock:true_random run tag @s add spawn_blaze_warden
execute if entity @s[tag=spawn_blaze_warden,scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[tag=spawn_blaze_warden,scores={attack_timer=1}] run summon minecraft:blaze ~ ~ ~ {CustomName:'[{"text":"Blaze Warden","color":"gold"}]',CustomNameVisible:1b,Health:60,HasVisualFire:1b,Tags:["blaze_warden"],HandItems:[{id:shield,tag:{Unbreakable:1,AttributeModifiers:[{AttributeName:"generic.movement_speed",Amount:-0.2,Operation:2,Name:"generic.movement_speed",UUID:[I;-123622,18249,19834,-36498]},{AttributeName:"generic.armor_toughness",Amount:10,Name:"generic.armor_toughness",UUID:[I;-123622,18349,19834,-36698]},{AttributeName:"generic.armor",Amount:0.2,Operation:1,Name:"generic.armor",UUID:[I;-123622,18449,19834,-36898]},{AttributeName:"generic.knockback_resistance",Amount:1,Name:"generic.knockback_resistance",UUID:[I;-123622,18549,19834,-37098]},{AttributeName:"generic.max_health",Amount:0.2,Operation:1,Name:"generic.max_health",UUID:[I;-123622,18649,19834,-37298]}],display:{Name:'[{"text":"Blaze Warden\'s Shield","italic":false,"color":"gold"}]'}},Count:1},{id:shield,Count:1}],HandDropChances:[0.05f,0.00f],ArmorItems:[{id:shield,Count:1},{id:shield,Count:1},{id:shield,Count:1},{id:shield,Count:1}],ArmorDropChances:[0.00f,0.00f,0.00f,0.00f],Attributes:[{Name:"generic.armor",Base:16f},{Name:"generic.movement_speed",Base:0.4f},{Name:"generic.knockback_resistance",Base:1f},{Name:"generic.attack_knockback",Base:5f},{Name:"generic.attack_damage",Base:10f},{Name:"generic.max_health",Base:100f}]}
execute if entity @s[tag=spawn_blaze_warden,scores={attack_timer=1}] as @e[tag=blaze_warden,limit=1,sort=nearest] run spreadplayers ~ ~ 5 17 false @s
execute if entity @s[tag=spawn_blaze_warden,scores={attack_timer=1}] run tag @s remove spawn_blaze_warden

execute if entity @e[tag=one_of_blaze_lord_shields] as @e[tag=one_of_blaze_lord_shields] at @s run function content_lock:bosses/blaze_lord/one_of_blaze_lord_shields
execute if entity @e[tag=one_of_blaze_lord_shields_three] as @e[tag=one_of_blaze_lord_shields_three] at @s run function content_lock:bosses/blaze_lord/one_of_blaze_lord_shields_three
execute if entity @e[tag=to_be_blaze_lord_lightning_struck] as @e[tag=to_be_blaze_lord_lightning_struck] at @s run function content_lock:bosses/blaze_lord/to_be_blaze_lord_lightning_struck
execute if entity @e[tag=fire_tornado_blaze_lord] as @e[tag=fire_tornado_blaze_lord] at @s run function content_lock:bosses/blaze_lord/fire_tornado_blaze_lord
execute if entity @e[tag=fire_tornado_blaze_lord] as @e[tag=fire_tornado_blaze_lord] at @s if entity @s[scores={timer1=1}] at @p run spreadplayers ~ ~ 0 3 false @s
execute if entity @e[tag=blaze_lord_fireball] as @e[tag=blaze_lord_fireball] at @s run function content_lock:bosses/blaze_lord/blaze_lord_fireball
execute if entity @e[tag=huge_blue_fireball_blaze_lord] as @e[tag=huge_blue_fireball_blaze_lord] at @s run function content_lock:bosses/blaze_lord/huge_blue_fireball_blaze_lord
execute if entity @e[tag=one_of_blaze_lord_shields_back] as @e[tag=one_of_blaze_lord_shields_back] at @s run function content_lock:bosses/blaze_lord/one_of_blaze_lord_shields_back
execute if entity @e[tag=blaze_lord_falling_star] as @e[tag=blaze_lord_falling_star] at @s run function content_lock:bosses/blaze_lord/blaze_lord_falling_star


scoreboard players add @s attack_timer 0
execute if entity @s[scores={attack_timer=140..},tag=!second_phase] run scoreboard players set @s attack_timer 0
execute if entity @s[scores={attack_timer=80..},tag=second_phase] run scoreboard players set @s attack_timer 0
execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={timer1=60..},tag=second_phase] run scoreboard players set @s timer1 0
execute if entity @s[tag=second_phase] run scoreboard players add @s timer1 1

execute if score L timer1 matches 7 run function content_lock:bosses/boss_player_count_scaling {distance:40}
execute if entity @s[tag=!second_phase] run function content_lock:bosses/boss_music {music:content_lock:music.blaze_lord_phase1,duration:4820}
execute if entity @s[tag=second_phase] run function content_lock:bosses/boss_music {music:content_lock:music.blaze_lord_phase2,duration:4780}

summon area_effect_cloud ~ ~ ~ {Duration:2,Tags:[check_for_blaze_lord_death]} 