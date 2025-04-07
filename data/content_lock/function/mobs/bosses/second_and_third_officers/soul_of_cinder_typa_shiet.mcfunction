#execute as @s if entity @s[scores={progression=100..}] run summon minecraft:wither_skeleton ~ ~ ~ {Health:40,CanPickUpLoot:1b,Tags:["post_wither_nig"],HandItems:[{id:netherite_sword,Count:1}],HandDropChances:[0.01f],ArmorItems:[{id:netherite_boots,Count:1},{},{id:netherite_chestplate,Count:1},{id:gray_banner,tag:{display:{Name:'[{"text":"Rebelion Banner","italic":false,"color":"dark_red"}]',Lore:['[{"text":"They aren\'t too happy","italic":false}]']},BlockEntityTag:{Base:7,Patterns:[{Pattern:cbo,Color:15},{Pattern:sku,Color:14},{Pattern:bo,Color:14},{Pattern:gru,Color:14}]}},Count:1}],ArmorDropChances:[0.01f,0f,0.01f,0.1f],Attributes:[{Name:"generic.attack_damage",Base:6f},{Name:"generic.knockback_resistance",Base:0.4f},{Name:"generic.follow_range",Base:2048f},{Name:"generic.movement_speed",Base:0.3f},{Name:"generic.max_health",Base:40f}]}

execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] facing entity @p eyes run tp @s ~ ~ ~ ~ 0
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^-1 ^ ^ 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^-1.5 ^0.3 ^ 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^-2 ^0.6 ^ 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^-2.5 ^0.9 ^ 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^-3 ^1.2 ^ 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=1..30}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^-3.5 ^1.5 ^ 0 0 0 0 1 force

execute if entity @s[scores={attack_timer=30}] run tp @s ~ ~ ~ ~90 30
execute if entity @s[scores={attack_timer=31..51}] run tp @s ~ ~ ~ ~-9 ~-2
execute if entity @s[scores={attack_timer=52}] run tp @s ~ ~ ~ ~ 30
execute if entity @s[scores={attack_timer=54..74}] run tp @s ~ ~ ~ ~9 ~-2
execute if entity @s[scores={attack_timer=78}] run tp @s ~ ~ ~ ~-90 -90
execute if entity @s[scores={attack_timer=83..93}] run tp @s ~ ~ ~ ~ ~15
execute if entity @s[scores={attack_timer=93..95}] run particle flame ~ ~ ~ 1 1 1 1 200 force @a
execute if entity @s[scores={attack_timer=93}] run playsound entity.generic.explode hostile @a ~ ~ ~ 2 0.5

execute if entity @s[scores={attack_timer=31..}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^ ^ ^1 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=31..}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^ ^ ^2 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=31..}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^ ^ ^3 0 0 0 0 1 force
execute if entity @s[scores={attack_timer=31..}] positioned ~ ~1.6 ~ run particle dust{color:[0.157, 0.157, 0.157],scale: 2} ^ ^ ^4 0 0 0 0 1 force

execute if entity @s[scores={attack_timer=1}] run playsound entity.wither.spawn hostile @a ~ ~ ~ 1 1.5
execute if entity @s[scores={attack_timer=31..51}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 0.1 1.5
execute if entity @s[scores={attack_timer=54..74}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 0.1 1.5
execute if entity @s[scores={attack_timer=83..93}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 0.1 1.5

execute if entity @s[scores={attack_timer=31..93}] as @a[distance=0..4] run tag @s add immobalize_by_soc_typa_shiet
execute if entity @r[tag=immobalize_by_soc_typa_shiet] as @a[tag=immobalize_by_soc_typa_shiet] at @s if entity @e[tag=immobalize_by_soc_typa_shiet_tp,distance=0..3] run tp @s @e[tag=immobalize_by_soc_typa_shiet_tp,distance=0..3,limit=1,sort=nearest]
execute if entity @r[tag=immobalize_by_soc_typa_shiet] at @a[tag=immobalize_by_soc_typa_shiet] run summon area_effect_cloud ~ ~ ~ {Tags:[immobalize_by_soc_typa_shiet_tp],Duration:2}
execute if entity @e[tag=immobalize_by_soc_typa_shiet_tp] as @e[tag=immobalize_by_soc_typa_shiet_tp] at @s run tp @s ~ ~ ~ facing entity @e[tag=wither_skeleton_revolution_leader,limit=1,sort=nearest]

execute if entity @s[scores={attack_timer=31..93}] positioned ~ ~0.6 ~ positioned ^ ^ ^1 as @a[distance=0..1] run damage @s 15 wither
execute if entity @s[scores={attack_timer=31..93}] positioned ~ ~0.6 ~ positioned ^ ^ ^2 as @a[distance=0..1] run damage @s 15 wither
execute if entity @s[scores={attack_timer=31..93}] positioned ~ ~0.6 ~ positioned ^ ^ ^3 as @a[distance=0..1] run damage @s 15 wither
execute if entity @s[scores={attack_timer=31..93}] positioned ~ ~0.6 ~ positioned ^ ^ ^4 as @a[distance=0..1] run damage @s 15 wither
execute if entity @s[scores={attack_timer=93..95}] as @a[distance=0..4] run damage @s 25 explosion

execute if entity @s[scores={attack_timer=99}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=99}] run tag @a remove immobalize_by_soc_typa_shiet
execute if entity @s[scores={attack_timer=99}] run tag @s remove soul_of_cinder_typa_shiet