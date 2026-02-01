#scoreboard players set @s content_lock.temp1 0
#execute unless biome ~ ~ ~ soul_sand_valley run scoreboard players set @s content_lock.temp1 2
#execute if score @s content_lock.temp1 matches 2 run title @s times 2 8 3
#execute if score @s content_lock.temp1 matches 2 run title @s actionbar [{"translate":"content_lock:notifications.can_only_spawn_in_soul_sand_valley","color":"dark_red"}]
#execute if score @s content_lock.temp1 matches 2 run return 0


summon wither_skeleton ~ ~ ~ {DeathLootTable:"content_lock:entities/second_officer",CustomName:[{"translate":"content_lock:boss.second_officer","bold":true,"color":"dark_red"}],CustomNameVisible:1b,Health:300,Glowing:1b,PersistenceRequired:1b,Tags:["content_lock.boss","content_lock.customized","content_lock.second_officer"],attributes:[{id:max_health,base:300f},{id:armor,base:16f},{id:armor_toughness,base:8f},{id:movement_speed,base:0.4f},{id:knockback_resistance,base:0.2f},{id:follow_range,base:1000f},{id:scale,base:1.5f}],equipment:{head:{id:"iron_helmet",components:{item_model:"content_lock:second_officer_cap",equippable:{slot:"head"}}}}}
summon phantom ~ ~ ~ {Silent:1b,active_effects:[{id:invisibility,duration:-1,amplifier:4,ambient:1b,show_particles:0b},{id:resistance,duration:-1,amplifier:4,ambient:1b,show_particles:0b},{id:fire_resistance,duration:-1,amplifier:4,ambient:1b,show_particles:0b}],Tags:["content_lock.progression_not_scaled","content_lock.third_officer.mount"],attributes:[{id:knockback_resistance,base:1.0f},{id:follow_range,base:1000f},{id:attack_damage,base:0f}],size:5}
summon ghast ~ ~ ~ {DeathLootTable:"content_lock:entities/third_officer",CustomName:[{"translate":"content_lock:boss.third_officer","bold":true,"color":"dark_red"}],CustomNameVisible:1b,Health:350,Glowing:1b,PersistenceRequired:1b,Tags:["content_lock.boss","content_lock.customized","content_lock.third_officer"],attributes:[{id:max_health,base:350f},{id:armor,base:0f},{id:armor_toughness,base:0f},{id:movement_speed,base:0.4f},{id:knockback_resistance,base:0.2f},{id:follow_range,base:1000f},{id:scale,base:0.75f}],Passengers:[{"id":"item_display","item":{"id":"iron_helmet",components:{item_model:"content_lock:third_officer_cap"}},"transformation":[4f,0f,0f,0f,0f,4f,0f,-2f,0f,0f,4f,0f,0f,0f,0f,1f],"Tags":["content_lock.third_officer.helmet"],Glowing:1b}]}
attribute @n[tag=content_lock.third_officer.mount] attack_damage modifier add content_lock.third_officer_mount_reduction -1 add_multiplied_total
execute if entity @s[type=player] run tag @e[type=wither_skeleton,tag=content_lock.second_officer] add content_lock.drop_summon_on_despawn
execute as @e[type=wither_skeleton,tag=content_lock.second_officer] run scoreboard players set @s content_lock.attack_timer 100
execute as @e[type=ghast,tag=content_lock.third_officer] run scoreboard players set @s content_lock.attack_timer 100
execute at @e[type=wither_skeleton,tag=content_lock.second_officer] run spreadplayers ~ ~ 15 20 false @e[tag=content_lock.boss]
tellraw @a [{"translate":"content_lock:notifications.boss_summoned.officers","color":"light_purple"}]

#clear @s pink_dye[custom_data~{"content_lock.enchanted_witch_summon":true}] 1
#advancement grant @s only content_lock:progression/spawn_enchanted_witch