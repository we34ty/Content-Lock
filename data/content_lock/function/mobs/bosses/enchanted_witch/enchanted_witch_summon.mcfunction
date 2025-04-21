summon witch ~ ~ ~ {DeathLootTable:"content_lock:entities/enchanted_witch",CustomName:'[{"translate":"content_lock:boss.enchanted_witch","bold":true,"color":"light_purple"}]',CustomNameVisible:1b,Health:250,Glowing:1b,PersistenceRequired:1b,Tags:["content_lock.boss","content_lock.customized","content_lock.enchanted_witch"],attributes:[{id:max_health,base:250f},{id:armor,base:10f},{id:armor_toughness,base:10f},{id:movement_speed,base:0.4f},{id:knockback_resistance,base:0.2f},{id:follow_range,base:1000f}]}
execute as @e[type=witch,tag=content_lock.enchanted_witch] run scoreboard players set @s content_lock.attack_timer 100
execute as @e[type=witch,tag=content_lock.enchanted_witch] at @s run spreadplayers ~ ~ 15 20 false @s
tellraw @a {"translate":"content_lock:notifications.boss_summoned.enchanted_witch","color":"light_purple"}

clear @s pink_dye[custom_data={"content_lock.enchanted_witch_summon":true}] 1
execute if entity @s[type=witch] run function content_lock:mobs/bosses/boss_despawn