execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b} 
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=1}] run playsound entity.iron_golem.attack hostile @a ~ ~ ~ 1 1.3
execute if entity @s[scores={attack_timer=1..}] run particle block{block_state:{Name:iron_block}} ~ ~ ~ 1 3 1 1 20 force @a
#execute if entity @s[scores={attack_timer=2..}] run function content_lock:player_passives/parry/projectile_parry_rotate
execute if entity @s[scores={attack_timer=2..}] run tp @s ^ ^ ^0.3
execute if entity @p[distance=0..1] run scoreboard players set @s attack_timer 40 
execute if entity @p[distance=14..] run scoreboard players set @s attack_timer 40 
execute if entity @s[scores={attack_timer=40}] run data merge entity @s {NoAI:0b} 
execute if entity @s[scores={attack_timer=40}] run tag @s remove under_player