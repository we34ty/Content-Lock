scoreboard players set @s content_lock.temp1 0
execute unless biome ~ ~ ~ soul_sand_valley run scoreboard players set @s content_lock.temp1 2
execute if score @s content_lock.temp1 matches 2 run title @s times 2 8 3
execute if score @s content_lock.temp1 matches 2 run title @s actionbar [{"translate":"content_lock:notifications.can_only_spawn_in_soul_sand_valley","color":"dark_red"}]
execute if score @s content_lock.temp1 matches 2 run return 0


summon wither_skeleton ~ ~ ~ {DeathLootTable:"content_lock:entities/second_officer",CustomName:[{"translate":"content_lock:boss.second_officer","bold":true,"color":"dark_red"}],CustomNameVisible:1b,Health:300,Glowing:1b,PersistenceRequired:1b,Tags:["content_lock.boss","content_lock.customized","content_lock.second_officer"],attributes:[{id:max_health,base:350f},{id:armor,base:16f},{id:armor_toughness,base:8f},{id:movement_speed,base:0.4f},{id:knockback_resistance,base:0.2f},{id:follow_range,base:1000f},{id:scale,base:1.5f}]}
summon ghast ~ ~ ~ {DeathLootTable:"content_lock:entities/third_officer",CustomName:[{"translate":"content_lock:boss.third_officer","bold":true,"color":"dark_red"}],CustomNameVisible:1b,Health:350,Glowing:1b,PersistenceRequired:1b,Tags:["content_lock.boss","content_lock.customized","content_lock.third_officer"],attributes:[{id:max_health,base:350f},{id:armor,base:0f},{id:armor_toughness,base:0f},{id:movement_speed,base:0.4f},{id:knockback_resistance,base:0.2f},{id:follow_range,base:1000f},{id:scale,base:0.75f}]}
execute if entity @s[type=player] run tag @e[type=wither_skeleton,tag=content_lock.second_officer] add content_lock.drop_summon_on_despawn
execute as @e[type=wither_skeleton,tag=content_lock.second_officer] run scoreboard players set @s content_lock.attack_timer 100
execute as @e[type=ghast,tag=content_lock.third_officer] run scoreboard players set @s content_lock.attack_timer 100
execute at @e[type=wither_skeleton,tag=content_lock.second_officer] run spreadplayers ~ ~ 15 20 false @e[tag=content_lock.boss]
tellraw @a [{"translate":"content_lock:notifications.boss_summoned.officers","color":"light_purple"}]