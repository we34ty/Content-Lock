execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run tag @s add break_ai

execute if entity @s[scores={attack_timer=10}] run playsound entity.wither.death hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={attack_timer=10}] run particle dust{color:[0.196, 0.114, 0.247],scale: 2} ~ ~ ~ 4.5 4.5 4.5 1 400 force @a
execute if entity @s[scores={attack_timer=40}] run playsound entity.wither.death hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={attack_timer=40}] run particle dust{color:[0.196, 0.114, 0.247],scale: 2} ~ ~ ~ 4.5 4.5 4.5 1 400 force @a
execute if entity @s[scores={attack_timer=60}] run playsound entity.wither.death hostile @a ~ ~ ~ 1 1.7
execute if entity @s[scores={attack_timer=60}] run particle dust{color:[0.196, 0.114, 0.247],scale: 2} ~ ~ ~ 4.5 4.5 4.5 1 400 force @a

execute if entity @s[scores={attack_timer=70}] run function content_lock:bosses/wither/soul_siphon_dmg
execute if entity @s[scores={attack_timer=71}] run data merge entity @s {NoAI:0b}

execute if entity @s[scores={attack_timer=80}] run function content_lock:bosses/wither/soul_siphon_dmg
execute if entity @s[scores={attack_timer=81}] run data merge entity @s {NoAI:0b}

execute if entity @s[scores={attack_timer=90}] run function content_lock:bosses/wither/soul_siphon_dmg
execute if entity @s[scores={attack_timer=91}] run data merge entity @s {NoAI:0b}

execute if entity @s[scores={attack_timer=100}] run function content_lock:bosses/wither/soul_siphon_dmg
execute if entity @s[scores={attack_timer=101}] run data merge entity @s {NoAI:0b}

execute if entity @s[scores={attack_timer=100}] run tag @s remove break_ai
execute if entity @s[scores={attack_timer=100}] run tag @s remove soul_siphon


