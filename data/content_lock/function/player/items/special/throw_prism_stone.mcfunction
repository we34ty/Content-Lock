execute if score @s content_lock.item_use_cooldown matches 1.. run return 0

execute at @s rotated ~ 0 positioned ^ ^ ^2 facing entity @s eyes positioned ^ ^ ^1 run particle glow_squid_ink ~ ~ ~ 0.2 0.2 0.2 1 10 normal @a
execute at @s rotated ~ 0 positioned ^ ^ ^2 facing entity @s eyes positioned ^ ^ ^1 run summon block_display ~ ~ ~ {Tags:["content_lock.prism_stone"],block_state:{Name:"minecraft:sea_lantern",Properties:{}},transformation:[0.2500f,0.0000f,0.0000f,-0.1250f,0.0000f,0.2500f,0.0000f,0.0000f,0.0000f,0.0000f,0.2500f,-0.1250f,0.0000f,0.0000f,0.0000f,1.0000f],CustomName:'{"translate": "content_lock:item.prism_stone"}',CustomNameVisible:false}
execute at @s rotated ~ 0 positioned ^ ^ ^2 facing entity @s eyes positioned ^ ^ ^1 as @e[type=block_display,tag=content_lock.prism_stone,limit=1,sort=nearest] rotated as @p run rotate @s ~ ~
execute at @s rotated ~ 0 positioned ^ ^ ^2 facing entity @s eyes positioned ^ ^ ^1 as @e[type=block_display,tag=content_lock.prism_stone,limit=1,sort=nearest] store result score @s content_lock.stored_y run data get entity @s Pos[1]
execute at @s run playsound minecraft:block.glass.break player @a ~ ~ ~ 0.5 1.6

scoreboard players set @s content_lock.item_use_cooldown 5
clear @s yellow_dye[custom_data={"content_lock.prism_stone":true}] 1