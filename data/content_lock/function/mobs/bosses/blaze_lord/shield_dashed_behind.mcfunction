execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] facing entity @p eyes run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={attack_timer=2..20}] positioned ~ ~1.4 ~ run particle soul_fire_flame ^ ^ ^1 0 0 0 0 2 force @a
execute if entity @s[scores={attack_timer=2..20}] run tp @s ~ ~ ~ ~18 ~1.5
execute if entity @s[scores={attack_timer=21}] at @p rotated as @p run summon armor_stand ^ ^ ^-2 {Pose:{LeftArm:[270f,0f,0f]},ShowArms:1b,Invisible:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["one_of_blaze_lord_shields_back"],HandItems:[{},{id:shield}],HandDropChances:[0f,0f]}
execute if entity @s[scores={attack_timer=21}] as @e[tag=one_of_blaze_lord_shields_back,limit=1,sort=nearest,tag=!rotated_already] at @s facing entity @p eyes run tp @s ~ ~-1 ~ ~90 0
execute if entity @s[scores={attack_timer=21}] as @e[tag=one_of_blaze_lord_shields_back,limit=1,sort=nearest,tag=!rotated_already] run tag @s add rotated_already

execute if entity @s[scores={attack_timer=31}] facing entity @p eyes run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={attack_timer=32..50}] positioned ~ ~1.4 ~ run particle soul_fire_flame ^ ^ ^1 0 0 0 0 2 force @a
execute if entity @s[scores={attack_timer=32..50}] run tp @s ~ ~ ~ ~18 ~1.5
execute if entity @s[scores={attack_timer=51}] at @p rotated as @p run summon armor_stand ^ ^ ^-2 {Pose:{LeftArm:[270f,0f,0f]},ShowArms:1b,Invisible:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["one_of_blaze_lord_shields_back"],HandItems:[{},{id:shield}],HandDropChances:[0f,0f]}
execute if entity @s[scores={attack_timer=51}] as @e[tag=one_of_blaze_lord_shields_back,limit=1,sort=nearest,tag=!rotated_already] at @s facing entity @p eyes run tp @s ~ ~-1 ~ ~90 0
execute if entity @s[scores={attack_timer=51}] as @e[tag=one_of_blaze_lord_shields_back,limit=1,sort=nearest,tag=!rotated_already] run tag @s add rotated_already

execute if entity @s[scores={attack_timer=52}] run tag @s remove shield_dashed_behind