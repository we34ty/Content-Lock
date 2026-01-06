execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 380
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

execute if entity @s[scores={content_lock.attack_timer=220}] facing entity @n[tag=content_lock.im_a_target] eyes run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=220}] at @n[tag=content_lock.im_a_target] run summon marker ~ ~ ~ {Tags:["content_lock.wither.big_ball_direct.enemy_pointer"]}
execute if entity @s[scores={content_lock.attack_timer=220}] run summon marker ~ ~8 ~ {Tags:["content_lock.wither.big_ball_direct.pointer"]}
execute if entity @s[scores={content_lock.attack_timer=220}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.5
execute if entity @s[scores={content_lock.attack_timer=10..220}] as @e[tag=content_lock.wither.big_ball_direct.pointer] at @s run function content_lock:mobs/bosses/wither/big_ball_direct_projectile
execute if entity @s[scores={content_lock.attack_timer=10..220}] as @e[tag=content_lock.wither.big_ball_direct.enemy_pointer] at @s facing entity @n[tag=content_lock.im_a_target] feet run tp @s ^ ^ ^0.1

execute if entity @s[scores={content_lock.attack_timer=10}] as @e[tag=content_lock.wither.big_ball_direct.enemy_pointer] run kill @s
execute if entity @s[scores={content_lock.attack_timer=10}] as @e[tag=content_lock.wither.big_ball_direct.pointer] run kill @s
execute if entity @s[scores={content_lock.attack_timer=220}] run tag @s remove content_lock.NoAI
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.wither.big_ball_direct