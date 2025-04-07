execute if entity @s[scores={attack_timer=0}] run scoreboard players add @s attack_timer 1 
execute if entity @s[scores={attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={attack_timer=1}] run effect give @s invisibility 1 0 true
execute if entity @s[scores={attack_timer=1}] at @p run summon area_effect_cloud ~ ~ ~ {Tags:[miejsce_do_teloprtacji_wither_leader],Duration:21} 
execute if entity @s[scores={attack_timer=1..20}] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 1
execute if entity @s[scores={attack_timer=1..20}] run particle cloud ~ ~ ~ 0.3 1.8 0.3 1 20 force
execute if entity @s[scores={attack_timer=21}] run summon minecraft:wither_skeleton ~ ~ ~ {Health:40,CanPickUpLoot:1b,Tags:["post_wither_nig"],HandItems:[{id:netherite_sword},{}],HandDropChances:[0.01f,0.00f],ArmorItems:[{id:netherite_boots},{},{id:netherite_chestplate},{id:gray_banner,components:{lore:['{"italic":false,"text":"They aren\'t too happy"}'],base_color:"gray",item_name:'{"color":"dark_red","italic":false,"text":"Rebelion Banner"}',banner_patterns:[{color:"black",pattern:"minecraft:curly_border"},{color:"red",pattern:"minecraft:skull"},{color:"red",pattern:"minecraft:border"},{color:"red",pattern:"minecraft:gradient_up"}]}}],ArmorDropChances:[0.01f,0f,0.01f,0.2f],attributes:[{id:"generic.attack_damage",base:6},{id:"generic.knockback_resistance",base:0.2},{id:"generic.follow_range",base:2048},{id:"minecraft:generic.movement_speed",base:0.1},{id:"generic.max_health",base:40f}]}
execute if entity @s[scores={attack_timer=21}] run tp @s @e[tag=miejsce_do_teloprtacji_wither_leader,limit=1,sort=nearest]
execute if entity @s[scores={attack_timer=22}] run particle dust{color:[0.141, 0.141, 0.141],scale: 1} ~ ~1 ~ 2 0 2 1 200 force @a
execute if entity @s[scores={attack_timer=22}] as @a[distance=0..2.5] run damage @s 15 wither
execute if entity @s[scores={attack_timer=23}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={attack_timer=23}] run tag @s remove teleport_switch_places