#title @s times 2 8 3
#title @s actionbar {"translate":"content_lock:notifications.error","color":"dark_red"}
#return 0

scoreboard players set @s content_lock.temp1 0
execute unless predicate content_lock:is_night run scoreboard players set @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 1 run title @s times 2 8 3
execute if score @s content_lock.temp1 matches 1 run title @s actionbar {"translate":"content_lock:notifications.can_only_spawn_at_night","color":"dark_red"}
execute if score @s content_lock.temp1 matches 1 run return 0

summon zombie_horse ~ ~ ~ {DeathLootTable:"",Health:1000,Glowing:1b,Tags:["content_lock.boss","content_lock.death_rider_horse","content_lock.customized"],active_effects:[{id:resistance,duration:-1,amplifier:5,show_particles:false}],attributes:[{id:max_health,base:1000f},{id:knockback_resistance,base:0.2f},{id:step_height,base:3f},{id:scale,base:0.8f},{id:armor,base:12f},{id:armor_toughness,base:8f},{id:movement_speed,base:0.26f}],Passengers:[{id:zombie,DeathLootTable:"content_lock:entities/death_rider",Health:300,CanBreakDoors:1b,CustomName:'[{"translate":"content_lock:boss.death_rider","color":"dark_gray","bold":true}]',CustomNameVisible:1b,Glowing:1b,Tags:["content_lock.boss","content_lock.death_rider","content_lock.customized"],ArmorItems:[{id:chainmail_boots,components:{trim:{pattern:tide,material:diamond}}},{id:chainmail_leggings,components:{trim:{pattern:tide,material:diamond}}},{id:chainmail_chestplate,components:{trim:{pattern:tide,material:diamond}}},{id:chainmail_helmet,components:{trim:{pattern:tide,material:diamond}}}],attributes:[{id:max_health,base:300.0f},{id:spawn_reinforcements,base:1f},{id:attack_damage,base:2f},{id:attack_knockback,base:10f},{id:scale,base:1.8f},{id:armor,base:-6f},{id:armor_toughness,base:4f},{id:follow_range,base:1000f},{id:"step_height",base:3f}]}]}
execute if entity @s[type=player] run tag @e[type=zombie_horse,tag=content_lock.death_rider_horse] add content_lock.drop_summon_on_despawn
execute as @e[type=zombie,tag=content_lock.death_rider] run scoreboard players set @s content_lock.attack_timer 100
execute as @e[type=zombie_horse,tag=content_lock.death_rider_horse] at @s run spreadplayers ~ ~ 15 20 false @s
ride @e[type=zombie,tag=content_lock.death_rider,limit=1,sort=nearest] mount @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest]

tellraw @a {"translate":"content_lock:notifications.boss_summoned.death_rider","color":"light_purple"}

clear @s pink_dye[custom_data~{"content_lock.death_rider_summon":true}] 1
execute if entity @s[type=zombie] run function content_lock:mobs/bosses/boss_despawn