execute if entity @s[scores={attack_timer=0}] run scoreboard players set @s timer1 101 
execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1}] rotated ~ 0 run summon area_effect_cloud ^3 ^ ^3 {Duration:100,Tags:["ghast_revolution_leader_hollow_puprle1"]}
execute if entity @s[scores={attack_timer=20}] rotated ~ 0 run summon area_effect_cloud ^-3 ^ ^3 {Duration:100,Tags:["ghast_revolution_leader_hollow_puprle2"]}
execute if entity @s[scores={attack_timer=1}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 2
execute if entity @s[scores={attack_timer=20}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 2

execute if entity @s[scores={attack_timer=1}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.5
execute if entity @s[scores={attack_timer=21}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.9
execute if entity @s[scores={attack_timer=61}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.8
#execute if entity @s[scores={attack_timer=71}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.7
#execute if entity @s[scores={attack_timer=91}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.9
#execute if entity @s[scores={attack_timer=111}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.6
#execute if entity @s[scores={attack_timer=141}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.6
#execute if entity @s[scores={attack_timer=161}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.7
#execute if entity @s[scores={attack_timer=181}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.9
#execute if entity @s[scores={attack_timer=201}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 1
#execute if entity @s[scores={attack_timer=221}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.9
#execute if entity @s[scores={attack_timer=241}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.8
#execute if entity @s[scores={attack_timer=261}] run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 0.7
execute if entity @s[scores={attack_timer=61}] run tag @s remove hollow_purple
