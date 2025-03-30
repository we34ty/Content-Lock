execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 200
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 160
execute if entity @s[scores={content_lock.attack_timer=160}] run data merge entity @s {NoAI:1b} 
execute if entity @s[scores={content_lock.attack_timer=160}] facing entity @p feet rotated ~ 0 run tp @s ~ ~ ~ ~ ~

summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.direction_to_look_for_iron_guardian]}
execute as @e[tag=content_lock.direction_to_look_for_iron_guardian,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p
execute anchored eyes rotated as @e[tag=content_lock.direction_to_look_for_iron_guardian,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
tp @s ^ ^ ^0.6

playsound entity.iron_golem.damage hostile @a ~ ~ ~ 0.5 1.3
particle block{block_state:{Name:iron_block}} ~ ~1.5 ~ 1 1.5 1 1 20 force @a
execute as @a[distance=0..2] run damage @s 8 fly_into_wall
execute positioned ~ ~1 ~ as @a[distance=0..2] run damage @s 8 fly_into_wall
execute positioned ~ ~-1 ~ as @a[distance=0..2] run damage @s 8 fly_into_wall

execute if entity @p[distance=0..2] run scoreboard players set @s content_lock.attack_timer 60
execute positioned ~ ~1 ~ if entity @p[distance=0..2] run scoreboard players set @s content_lock.attack_timer 60
execute positioned ~ ~-1 ~ if entity @p[distance=0..2] run scoreboard players set @s content_lock.attack_timer 60
execute if entity @s[scores={content_lock.attack_timer=60}] run data merge entity @s {NoAI:0b} 
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.iron_fist_charge
