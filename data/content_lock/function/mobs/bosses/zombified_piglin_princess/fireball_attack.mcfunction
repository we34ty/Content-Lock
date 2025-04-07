execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1..}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=1}] run summon armor_stand ~ ~2.7 ~ {Invisible:1b,Small:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[zombified_piglin_princess_fireball]}
execute if entity @s[scores={attack_timer=1}] as @e[tag=zombified_piglin_princess_fireball,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=11}] as @a[distance=0..40] at @s run playsound minecraft:entity.blaze.shoot hostile @s ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=16}] run summon armor_stand ~ ~2.7 ~ {Invisible:1b,Small:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[zombified_piglin_princess_fireball]}
execute if entity @s[scores={attack_timer=16}] as @e[tag=zombified_piglin_princess_fireball,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=26}] as @a[distance=0..40] at @s run playsound minecraft:entity.blaze.shoot hostile @s ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=31}] run summon armor_stand ~ ~2.7 ~ {Invisible:1b,Small:1b,DisabledSlots:4144959,Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[zombified_piglin_princess_fireball]}
execute if entity @s[scores={attack_timer=31}] as @e[tag=zombified_piglin_princess_fireball,limit=1,sort=nearest] at @s facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=41}] as @a[distance=0..40] at @s run playsound minecraft:entity.blaze.shoot hostile @s ~ ~ ~ 1 1
execute if entity @s[scores={attack_timer=42}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=42}] run tag @s remove fireball_attack