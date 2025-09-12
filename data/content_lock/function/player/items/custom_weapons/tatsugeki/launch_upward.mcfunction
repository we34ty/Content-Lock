scoreboard players set @s content_lock.anchor_sneak 0
tag @s add content_lock.tatsugeki.anchor_sneak
summon dolphin ~ ~ ~ {Silent:1b,Tags:["content_lock.tatsugeki.dolphin","content_lock.tatsugeki.dolphin.upward"],DeathLootTable:"",attributes:[{id:"max_health",base:0},{id:"fall_damage_multiplier",base:-1},{id:"attack_damage",base:1}],Moistness:40,DeathTime:20s,CustomName:[{"translate":"content_lock:mob.tatsugeki.dolphin"}],CustomNameVisible:0b}
ride @s mount @e[tag=content_lock.tatsugeki.dolphin,limit=1,sort=nearest]
tag @s remove content_lock.tatsugeki.anchor_sneak_counted

execute store result entity @e[tag=content_lock.tatsugeki.dolphin,limit=1,sort=nearest] attributes[2].base double 0.001 run attribute @s attack_damage get 1000

data merge storage content_lock:saved_stats {speed:1}
execute store result storage content_lock:saved_stats speed double 0.01 run attribute @s movement_speed get 1500
execute as @e[tag=content_lock.tatsugeki.dolphin,limit=1,sort=nearest] at @s rotated as @p[tag=content_lock.tatsugeki.anchor_sneak] rotated ~ -60 run summon area_effect_cloud ^ ^ ^5 {Tags:["content_lock.tatsugeki.dolphin.area"],Duration:1,custom_particle:{type:"block",block_state:"air"}}
execute as @e[tag=content_lock.tatsugeki.dolphin,limit=1,sort=nearest] at @s run function content_lock:player/items/custom_weapons/tatsugeki/motion with storage content_lock:saved_stats

execute if score L content_lock.options.player.stamina matches 1.. run function lsp:attacking

playsound entity.player.splash.high_speed player @a ~ ~ ~ 1 1.7
playsound entity.dolphin.jump player @a ~ ~ ~ 1 0.7
playsound entity.dolphin.attack player @a ~ ~ ~ 1 0.7
playsound entity.dolphin.attack player @a ~ ~ ~ 1 0.7
playsound entity.dolphin.attack player @a ~ ~ ~ 1 0.7
playsound entity.dolphin.attack player @a ~ ~ ~ 1 0.7
particle falling_water ~ ~1 ~ 1 1 1 1 40 normal @a 
particle bubble_column_up ~ ~1 ~ 1 1 1 1 40 normal @a 
particle white_smoke ~ ~1 ~ 0.5 0.5 0.5 0.2 10 normal @a

scoreboard players set @s content_lock.temp1 -20
item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add