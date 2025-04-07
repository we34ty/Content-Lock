
execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] facing entity @p feet run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={attack_timer=2}] run summon armor_stand ^0.4 ^ ^ {Pose:{LeftArm:[270f,0f,0f]},ShowArms:1b,Invisible:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["one_of_blaze_lord_shields_three"],HandItems:[{},{id:shield,Count:1}],HandDropChances:[0f,0f]}
execute if entity @s[scores={attack_timer=2}] as @e[tag=one_of_blaze_lord_shields_three,limit=1,sort=nearest,tag=!rotated_already] at @s facing entity @p feet run tp @s ~ ~-0.5 ~ ~90 0
execute if entity @s[scores={attack_timer=2}] as @e[tag=one_of_blaze_lord_shields_three,limit=1,sort=nearest,tag=!rotated_already] run tag @s add rotated_already
execute if entity @s[scores={attack_timer=2}] run summon armor_stand ^-0.2 ^ ^-0.3 {Pose:{LeftArm:[270f,0f,0f]},ShowArms:1b,Invisible:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["one_of_blaze_lord_shields_three"],HandItems:[{},{id:shield,Count:1}],HandDropChances:[0f,0f]}
execute if entity @s[scores={attack_timer=2}] as @e[tag=one_of_blaze_lord_shields_three,limit=1,sort=nearest,tag=!rotated_already] at @s facing entity @p feet run tp @s ~ ~-0.5 ~ ~-15 0
execute if entity @s[scores={attack_timer=2}] as @e[tag=one_of_blaze_lord_shields_three,limit=1,sort=nearest,tag=!rotated_already] run tag @s add rotated_already
execute if entity @s[scores={attack_timer=2}] run summon armor_stand ^-0.2 ^ ^0.3 {Pose:{LeftArm:[270f,0f,0f]},ShowArms:1b,Invisible:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["one_of_blaze_lord_shields_three"],HandItems:[{},{id:shield,Count:1}],HandDropChances:[0f,0f]}
execute if entity @s[scores={attack_timer=2}] as @e[tag=one_of_blaze_lord_shields_three,limit=1,sort=nearest,tag=!rotated_already] at @s facing entity @p feet run tp @s ~ ~-0.5 ~ ~-125 0
execute if entity @s[scores={attack_timer=2}] as @e[tag=one_of_blaze_lord_shields_three,limit=1,sort=nearest,tag=!rotated_already] run tag @s add rotated_already
execute if entity @s[scores={attack_timer=3}] run playsound entity.blaze.shoot hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={attack_timer=3}] run tag @s remove three_shields_round