execute if entity @s[nbt={OnGround:0b}] run return run scoreboard players set @s content_lock.venom_billiard_cue_countdown 0

scoreboard players add @s content_lock.venom_billiard_cue_countdown 1

execute unless score @s content_lock.venom_billiard_cue_countdown matches 32.. run return 0

playsound entity.blaze.hurt player @a ~ ~ ~ 1 1
execute positioned ~ ~1 ~ positioned ^ ^ ^1 run particle enchanted_hit ~ ~ ~ 0.3 0.3 0.3 1 40 normal @a
execute positioned ~ ~1 ~ positioned ^ ^ ^1 run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["content_lock.venom_billiard_ball"],Duration:400}
execute positioned ~ ~1 ~ positioned ^ ^ ^1 run summon block_display ~-0.5 ~-0.5 ~-0.5 {Tags:["content_lock.venom_billiard_ball"],block_state:{Name:"minecraft:light_blue_concrete",Properties:{}},transformation:[0.4000f,0.0000f,0.0000f,0.3125f,0.0000f,0.4000f,0.0000f,0.3125f,0.0000f,0.0000f,0.4000f,0.3125f,0.0000f,0.0000f,0.0000f,1.0000f]}
scoreboard players set @s content_lock.venom_billiard_cue_countdown 0