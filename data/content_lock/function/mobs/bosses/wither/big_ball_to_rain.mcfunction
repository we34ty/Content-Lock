execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 350
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 340

execute if entity @s[scores={content_lock.attack_timer=340}] run tag @s add content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=340}] run playsound entity.wither.hurt hostile @a ~ ~ ~ 4 0.2
execute if entity @s[scores={content_lock.attack_timer=340}] run rotate @s ~ -75

execute if entity @s[scores={content_lock.attack_timer=301..340}] run particle dust{color:4276551,scale:3} ~ ~8 ~ 1 1 1 1 3 force @a
execute if entity @s[scores={content_lock.attack_timer=301..340}] run particle soul ~ ~8 ~ 1 1 1 0.05 1 normal @a
execute if entity @s[scores={content_lock.attack_timer=301..340}] run particle soul_fire_flame ~ ~8 ~ 1 1 1 0.05 1 normal @a

execute if entity @s[scores={content_lock.attack_timer=261..300}] run particle dust{color:4276551,scale:3} ~ ~8 ~ 1.5 1.5 1.5 1 6 force @a
execute if entity @s[scores={content_lock.attack_timer=261..300}] run particle soul ~ ~8 ~ 2 2 2 0.1 2 normal @a
execute if entity @s[scores={content_lock.attack_timer=261..300}] run particle soul_fire_flame ~ ~8 ~ 2 2 2 0.1 3 normal @a

execute if entity @s[scores={content_lock.attack_timer=221..260}] run particle dust{color:4276551,scale:3} ~ ~8 ~ 2 2 2 1 12 force @a
execute if entity @s[scores={content_lock.attack_timer=221..260}] run particle soul ~ ~8 ~ 3 3 3 0.2 4 normal @a
execute if entity @s[scores={content_lock.attack_timer=221..260}] run particle soul_fire_flame ~ ~8 ~ 3 3 3 0.2 7 normal @a

execute if entity @s[scores={content_lock.attack_timer=220}] run summon marker ~ ~8 ~ {Tags:["content_lock.wither.big_ball_to_rain.pointer"]}
execute if entity @s[scores={content_lock.attack_timer=220}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.5
execute if entity @s[scores={content_lock.attack_timer=200..220}] as @e[tag=content_lock.wither.big_ball_to_rain.pointer] at @s run function content_lock:mobs/bosses/wither/big_ball_to_rain_projectile
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.wither.big_ball_to_rain.pointer] run particle soul_fire_flame ~ ~8 ~ 3 3 3 1 20 normal @a[distance=..10]
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.wither.big_ball_to_rain.pointer] run particle soul ~ ~8 ~ 3 3 3 1 20 normal @a[distance=..10]
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.wither.big_ball_to_rain.pointer] run particle dust{color:4276551,scale:3} ~ ~8 ~ 5 1 5 1 20 force @a[distance=..10]
execute if entity @s[scores={content_lock.attack_timer=200}] at @e[tag=content_lock.wither.big_ball_to_rain.pointer] run playsound entity.wither.break_block hostile @a ~ ~ ~ 4 0.5
execute if entity @s[scores={content_lock.attack_timer=200}] as @e[tag=content_lock.wither.big_ball_to_rain.pointer] run kill @s

execute if entity @s[scores={content_lock.attack_timer=141..170}] at @e[distance=..40,type=#boss_can_damage] run summon marker ~ ~ ~ {Tags:["content_lock.wither.big_ball_to_rain.rain_pointer"]}
execute if entity @s[scores={content_lock.attack_timer=141..170}] as @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer,tag=!content_lock.wither.big_ball_to_rain.rain_pointer.rand] at @s run spreadplayers ~ ~ 1 6 false @s
execute if entity @s[scores={content_lock.attack_timer=141..170}] as @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer,tag=!content_lock.wither.big_ball_to_rain.rain_pointer.rand] run tag @s add content_lock.wither.big_ball_to_rain.rain_pointer.rand
execute if entity @s[scores={content_lock.attack_timer=140}] as @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer] at @s run data modify entity @s Pos[1] set from entity @n[type=#boss_can_damage] Pos[1]
execute if entity @s[scores={content_lock.attack_timer=140}] as @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer] at @s run tp @s ~ ~8 ~
execute if entity @s[scores={content_lock.attack_timer=140}] at @e[distance=..40,type=#boss_can_damage] run summon marker ~ ~8 ~ {Tags:["content_lock.wither.big_ball_to_rain.rain_pointer"]}
execute if entity @s[scores={content_lock.attack_timer=10..140}] at @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer,tag=!content_lock.wither.big_ball_to_rain.rain_pointer.launched] run particle dust{color:4276551,scale:2} ~ ~ ~ 0.3 0.3 0.3 1 2 force @a
execute if entity @s[scores={content_lock.attack_timer=10..140}] at @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer,tag=!content_lock.wither.big_ball_to_rain.rain_pointer.launched] run particle soul ~ ~ ~ 0.3 0.3 0.3 0.01 1 normal @a
execute if entity @s[scores={content_lock.attack_timer=10..120}] as @e[type=#minecraft:boss_can_damage,distance=..40] as @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer,tag=!content_lock.wither.big_ball_to_rain.rain_pointer.launched,limit=1,sort=random] run tag @s add content_lock.wither.big_ball_to_rain.rain_pointer.launched
execute if entity @s[scores={content_lock.attack_timer=10..120}] as @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer.launched] at @s run function content_lock:mobs/bosses/wither/big_ball_to_rain_projectile_rain


execute if entity @s[scores={content_lock.attack_timer=10}] run kill @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer]
execute if entity @s[scores={content_lock.attack_timer=170}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.wither.big_ball_to_rain