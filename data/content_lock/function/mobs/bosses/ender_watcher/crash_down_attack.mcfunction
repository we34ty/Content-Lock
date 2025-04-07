execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
summon area_effect_cloud ~ ~ ~ {Tags:[direction_to_look_for_crash_down_attack]}
execute as @e[tag=direction_to_look_for_crash_down_attack,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p
execute anchored eyes rotated as @e[tag=direction_to_look_for_crash_down_attack,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^20 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
function content_lock:player_passives/parry/projectile_parry_rotate
execute if block ^ ^ ^0.7 #walkable run tp @s ^ ^ ^0.7
particle flame ~ ~ ~ 0.3 0.3 0.3 0.7 20 force @a
playsound item.firecharge.use hostile @a ~ ~ ~ 0.2 1.7
execute unless block ^ ^ ^0.7 #walkable run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force
execute unless block ^ ^ ^0.7 #walkable as @a[distance=0..4] run damage @s 60 explosion by @s
execute unless block ^ ^ ^0.7 #walkable run scoreboard players set @s attack_timer 100
execute if entity @s[scores={attack_timer=100}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=100}] run tag @s remove crash_down_attack