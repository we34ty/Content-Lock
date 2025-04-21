scoreboard players set @s content_lock.temp1 0
execute if predicate content_lock:is_night run scoreboard players set @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 1 run title @s times 2 8 3
execute if score @s content_lock.temp1 matches 1 run title @s actionbar {"translate":"content_lock:notifications.can_only_spawn_at_day","color":"dark_red"}
execute if score @s content_lock.temp1 matches 1 run return 0

summon iron_golem ~ ~ ~ {DeathLootTable:"content_lock:entities/iron_guardian",CustomName:'[{"translate":"content_lock:boss.iron_guardian","color":"gray","bold":true}]',CustomNameVisible:1b,Health:200,Glowing:1b,PersistenceRequired:1b,Tags:["content_lock.boss","content_lock.iron_guardian"],attributes:[{id:max_health,base:200f},{id:knockback_resistance,base:0.3f},{id:movement_speed,base:0.3f},{id:attack_knockback,base:3f},{id:scale,base:1.5f},{id:attack_damage,base:5f}]}
execute as @e[type=witch,tag=content_lock.iron_guardian] run scoreboard players set @s content_lock.attack_timer 100
execute as @e[type=iron_golem,tag=content_lock.iron_guardian] at @s run spreadplayers ~ ~ 15 20 false @s

tellraw @a {"translate":"content_lock:notifications.boss_summoned.iron_guardian","color":"light_purple"}
clear @s pink_dye[custom_data={"content_lock.iron_guardian_summon":true}] 1

