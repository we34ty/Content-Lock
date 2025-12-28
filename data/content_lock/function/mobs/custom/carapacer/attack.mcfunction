execute if score @s content_lock.ai_option matches 1 run function animated_java:carapacer/animations/walk_small_new/stop
execute if score @s content_lock.ai_option matches 1 run function animated_java:carapacer/animations/idle_small_new/stop
execute if score @s content_lock.ai_option matches 1 run function animated_java:carapacer/animations/walk_big_new/stop
execute if score @s content_lock.ai_option matches 1 run function animated_java:carapacer/animations/idle_big_new/stop
execute if score @s content_lock.ai_option matches 1 run function animated_java:carapacer/animations/attack_new/play
execute if score @s content_lock.ai_option matches 1 run data merge entity @e[tag=content_lock.carapacer.current,limit=1] {NoAI:1b}
execute if score @s content_lock.ai_option matches 1 run playsound content_lock:entity.carapacer.attack hostile @a ~ ~ ~ 1

tag @s add content_lock.attacker
execute if score @s content_lock.ai_option matches 5 positioned ^ ^ ^1 run execute positioned ~-1 ~-1 ~-1 if entity @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] as @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] run damage @s 4 mob_attack by @e[tag=content_lock.carapacer.current,limit=1] from @e[tag=content_lock.carapacer.current,limit=1]
execute if score @s content_lock.ai_option matches 5 positioned ^ ^ ^2 run execute positioned ~-1 ~-1 ~-1 if entity @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] as @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] run damage @s 4 mob_attack by @e[tag=content_lock.carapacer.current,limit=1] from @e[tag=content_lock.carapacer.current,limit=1]
execute if score @s content_lock.ai_option matches 5 positioned ^ ^ ^3 run execute positioned ~-1 ~-1 ~-1 if entity @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] as @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] run damage @s 4 mob_attack by @e[tag=content_lock.carapacer.current,limit=1] from @e[tag=content_lock.carapacer.current,limit=1]
execute if score @s content_lock.ai_option matches 5 positioned ^ ^ ^1 run execute positioned ~-1 ~-1 ~-1 if entity @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] as @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] run scoreboard players add @s content_lock.bleed_stacks 15
execute if score @s content_lock.ai_option matches 5 positioned ^ ^ ^1 run execute positioned ~-1 ~-1 ~-1 if entity @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] as @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] run scoreboard players add @s content_lock.bleed_stacks 15
execute if score @s content_lock.ai_option matches 5 positioned ^ ^ ^1 run execute positioned ~-1 ~-1 ~-1 if entity @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] as @e[type=#boss_can_damage,tag=!content_lock.boss,dx=2,dy=2,dz=2] run scoreboard players add @s content_lock.bleed_stacks 15
tag @s remove content_lock.attacker

execute if score @s content_lock.ai_option matches 10 run function animated_java:carapacer/animations/attack_new/stop
execute if score @s content_lock.ai_option matches 10 run data merge entity @e[tag=content_lock.carapacer.current,limit=1] {NoAI:0b}
execute if score @s content_lock.ai_option matches 10 run tag @s remove content_lock.carapacer.moving
scoreboard players add @s content_lock.ai_option 1
execute if score @s content_lock.ai_option matches 50.. run scoreboard players set @s content_lock.ai_option 0
