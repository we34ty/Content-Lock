execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 280
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 240

execute if entity @s[scores={content_lock.attack_timer=240}] run playsound block.beacon.activate hostile @a ~ ~ ~ 4 0.3
execute if entity @s[scores={content_lock.attack_timer=240}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.2
execute if entity @s[scores={content_lock.attack_timer=201..240}] run particle dust{color:4276551,scale:3} ~ ~1 ~ 1 2 1 1 5 force @a
execute if entity @s[scores={content_lock.attack_timer=201..240}] run particle soul ~ ~1 ~ 1 2 1 0.05 2 normal @a
execute if entity @s[scores={content_lock.attack_timer=201..240}] run particle soul_fire_flame ~ ~1 ~ 1 2 1 0.05 3 normal @a


execute if entity @s[scores={content_lock.attack_timer=71..200}] at @n[tag=content_lock.im_a_target] run summon marker ~ ~ ~ {Tags:["content_lock.wither.3_lasers.pointer"]}
execute if entity @s[scores={content_lock.attack_timer=40..200}] as @e[tag=content_lock.wither.3_lasers.pointer] if score @s content_lock.timer1 matches 30.. run kill @s
execute if entity @s[scores={content_lock.attack_timer=40..200}] run scoreboard players add @e[tag=content_lock.wither.3_lasers.pointer] content_lock.timer1 1
execute if entity @s[scores={content_lock.attack_timer=40..170}] run scoreboard players set @s content_lock.timer2 0
execute if entity @s[scores={content_lock.attack_timer=170}] run data merge storage content_lock:saved_stats {pitch:0.0f}
execute if entity @s[scores={content_lock.attack_timer=40..170}] store result storage content_lock:saved_stats pitch float 0.1 run random value -50..50
execute if entity @s[scores={content_lock.attack_timer=40..170}] run function content_lock:mobs/bosses/wither/3_lasers_rotate with storage content_lock:saved_stats
execute if entity @s[scores={content_lock.attack_timer=170}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.2
execute if entity @s[scores={content_lock.attack_timer=130}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.2
execute if entity @s[scores={content_lock.attack_timer=90}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 0.2

execute if entity @s[scores={content_lock.attack_timer=10}] run kill @e[tag=content_lock.wither.3_lasers.pointer]
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.wither.3_lasers