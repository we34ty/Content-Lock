#execute as @s if entity @s[scores={progression=100..}] run summon minecraft:wither_skeleton ~ ~ ~ {Health:40,CanPickUpLoot:1b,Tags:["post_wither_nig"],HandItems:[{id:netherite_sword,Count:1}],HandDropChances:[0.01f],ArmorItems:[{id:netherite_boots,Count:1},{},{id:netherite_chestplate,Count:1},{id:gray_banner,tag:{display:{Name:'[{"text":"Rebelion Banner","italic":false,"color":"dark_red"}]',Lore:['[{"text":"They aren\'t too happy","italic":false}]']},BlockEntityTag:{Base:7,Patterns:[{Pattern:cbo,Color:15},{Pattern:sku,Color:14},{Pattern:bo,Color:14},{Pattern:gru,Color:14}]}},Count:1}],ArmorDropChances:[0.01f,0f,0.01f,0.1f],Attributes:[{Name:"generic.attack_damage",Base:6f},{Name:"generic.knockback_resistance",Base:0.4f},{Name:"generic.follow_range",Base:2048f},{Name:"generic.movement_speed",Base:0.3f},{Name:"generic.max_health",Base:40f}]}

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=..4] if predicate content_lock:true_random run tag @s add withered_breath
execute if entity @s[tag=withered_breath] run function content_lock:bosses/second_and_third_officers/withered_breath

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=..4] run tag @s add soul_of_cinder_typa_shiet
execute if entity @s[tag=soul_of_cinder_typa_shiet] run function content_lock:bosses/second_and_third_officers/soul_of_cinder_typa_shiet

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=5..10] if predicate content_lock:true_random run tag @s add wither_tentacle_summon
execute if entity @s[tag=wither_tentacle_summon] run function content_lock:bosses/second_and_third_officers/wither_tentacle_summon

execute if entity @s[scores={attack_timer=0}] if entity @p[distance=8..] run tag @s add teleport_switch_places
execute if entity @s[tag=teleport_switch_places] run function content_lock:bosses/second_and_third_officers/teleport_switch_places

execute if entity @e[tag=wither_skeleton_revolution_leader_tentacle] as @e[tag=wither_skeleton_revolution_leader_tentacle] at @s run function content_lock:bosses/second_and_third_officers/wither_skeleton_revolution_leader_tentacle

execute if score L timer1 matches 7 run function content_lock:bosses/boss_player_count_scaling {distance:40}

execute if entity @e[tag=ghast_revolution_leader,distance=0..40] run function content_lock:bosses/boss_music {song:music.content_lock.both_officers,duration:4400}
execute unless entity @e[tag=ghast_revolution_leader,distance=0..40] run function content_lock:bosses/boss_music {song:music.content_lock.one_officer,duration:5520}
execute if entity @s[tag=!separated_leaders] unless entity @e[tag=ghast_revolution_leader,distance=0..40] run scoreboard players set @a[distance=0..80] RestartMusic 1
execute unless entity @e[tag=ghast_revolution_leader,distance=0..40] run tag @s add separated_leaders
execute if entity @s[tag=separated_leaders] if entity @e[tag=ghast_revolution_leader,distance=0..40] run scoreboard players set @a[distance=0..80] RestartMusic 1
execute if entity @s[tag=separated_leaders] if entity @e[tag=ghast_revolution_leader,distance=0..40] run tag @s remove separated_leaders

scoreboard players add @s attack_timer 0
execute if entity @s[scores={attack_timer=1..}] run scoreboard players add @s attack_timer 1
execute if entity @e[tag=ghast_revolution_leader,distance=0..40] if entity @s[scores={attack_timer=160..}] run scoreboard players set @s attack_timer 0
execute unless entity @e[tag=ghast_revolution_leader,distance=0..40] if entity @s[scores={attack_timer=100..}] run scoreboard players set @s attack_timer 0