scoreboard players add @s progression 1
particle minecraft:small_flame ^ ^ ^0.5 0 0 0 0 1 force @a
particle minecraft:small_flame ^ ^ ^-0.5 0 0 0 0 1 force @a
tp @s ~ ~0.05 ~ ~15 ~
execute at @s[scores={progression=98}] run summon tnt
execute at @s[scores={progression=100}] run summon zombified_piglin ~ ~ ~ {Tags:[zombified_piglin_princess_phase_1,boss]}
execute at @s[scores={progression=100}] run bossbar set minecraft:zombified_piglin_princess value 600
execute as @s[scores={progression=100..}] at @s run give @p nether_star
kill @s[scores={progression=100..}]
#data merge entity @s[scores={progression=100..}] {NoGravity:0b}
