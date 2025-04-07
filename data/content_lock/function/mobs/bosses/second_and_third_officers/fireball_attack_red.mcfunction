execute if entity @s[scores={attack_timer=0}] run scoreboard players set @s timer1 61
execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1}] run summon area_effect_cloud ^ ^ ^3 {Duration:141,Tags:["ghast_revolution_leader_fireball_red"]}
execute if entity @s[scores={attack_timer=10}] run summon area_effect_cloud ^3 ^ ^3 {Duration:141,Tags:["ghast_revolution_leader_fireball_red"]}
execute if entity @s[scores={attack_timer=20}] run summon area_effect_cloud ^-3 ^ ^3 {Duration:141,Tags:["ghast_revolution_leader_fireball_red"]}
execute if entity @s[scores={attack_timer=1}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=10}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=20}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=39}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 2
execute if entity @s[scores={attack_timer=50}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 2
execute if entity @s[scores={attack_timer=60}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 2
execute if entity @s[scores={attack_timer=61}] run tag @s remove fireball_attack_red