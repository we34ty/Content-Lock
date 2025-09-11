scoreboard players set @s content_lock.temp1 0
execute at @s unless biome ~ ~ ~ minecraft:nether_wastes run scoreboard players set @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 1 run title @s times 2 8 3
execute if score @s content_lock.temp1 matches 1 run title @s actionbar [{"translate":"content_lock:notifications.can_only_spawn_in_nether_wastes","color":"dark_red"}]
execute if score @s content_lock.temp1 matches 1 run return 0

summon zombified_piglin ~ ~ ~ {Health:600,Glowing:1b,PersistenceRequired:1b,CustomName:[{"translate":"content_lock:boss.zombified_piglin_princess","color":"gold","bold":true}],Tags:["content_lock.boss","content_lock.zombified_piglin_princess","content_lock.customized","content_lock.zombified_piglin_princess.begin"],CustomNameVisible:1b,equipment:{chest:{id:golden_chestplate,components:{trim:{pattern:silence,material:quartz},enchantments:{fire_protection:4},attribute_modifiers:[{type:armor,amount:0,slot:chest,operation:add_value,id:"content_lock.zombified_piglin_princess"}]}},head:{id:piglin_head,components:{enchantments:{fire_protection:4},attribute_modifiers:[{type:armor,amount:0,slot:chest,operation:add_value,id:"content_lock.zombified_piglin_princess"}]}}},drop_chances:{body:0.0f,head:0.0f},attributes:[{id:max_health,base:600f},{id:attack_damage,base:4f},{id:movement_speed,base:0.2f},{id:knockback_resistance,base:0.1f},{id:scale,base:1.4f},{id:step_height,base:2f}]}
#execute as @e[type=minecraft:zombified_piglin,tag=content_lock.zombified_piglin_princess] run scoreboard players set @s content_lock.attack_timer 100
execute if entity @s[type=player] run tag @e[type=zombified_piglin,tag=content_lock.zombified_piglin_princess] add content_lock.drop_summon_on_despawn

tellraw @a [{"translate":"content_lock:notifications.boss_summoned.zombified_piglin_princess","color":"light_purple"}]

clear @s pink_dye[custom_data~{"content_lock.zombified_piglin_princess_summon":true}] 1