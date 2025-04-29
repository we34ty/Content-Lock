execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.combo_counter 0
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 160
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 140
execute if entity @s[scores={content_lock.attack_timer=140}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=140}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=140}] run playsound entity.zombified_piglin.hurt hostile @a ~ ~ ~ 5 1.5
execute if entity @s[scores={content_lock.attack_timer=140}] run effect give @s invisibility 1 0 true
execute if entity @s[scores={content_lock.attack_timer=130}] run data merge entity @s {Glowing:0b}
execute if entity @s[scores={content_lock.attack_timer=120}] run data merge entity @s {Glowing:1b}
execute if entity @s[scores={content_lock.attack_timer=140}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] run summon area_effect_cloud ~ ~ ~ {Duration:21,Tags:["content_lock.zombified_piglin_princess.phase_in.area"]}
execute if entity @s[scores={content_lock.attack_timer=120..140}] run particle crimson_spore ~ ~1.5 ~ 1 1.5 1 1 30 normal
execute if entity @s[scores={content_lock.attack_timer=120..140}] run particle electric_spark ~ ~1.5 ~ 1 1.5 1 1 5 force
execute if entity @s[scores={content_lock.attack_timer=120..140}] at @e[tag=content_lock.zombified_piglin_princess.phase_in.area] run particle flame ~ ~1.5 ~ 1 1.5 1 0.1 5 force
execute if entity @s[scores={content_lock.attack_timer=120..140}] at @e[tag=content_lock.zombified_piglin_princess.phase_in.area] run playsound block.furnace.fire_crackle hostile @a ~ ~ ~ 5 1
execute if entity @s[scores={content_lock.attack_timer=120}] run tp @s @e[tag=content_lock.zombified_piglin_princess.phase_in.area,limit=1,sort=nearest]


execute if entity @s[scores={content_lock.attack_timer=110}] unless score @s content_lock.combo_counter matches 2.. positioned ~-4 ~-4 ~-4 if entity @e[tag=content_lock.im_a_target,type=#minecraft:boss_can_damage,dx=8,dy=8,dz=8] run tag @s add content_lock.zombified_piglin_princess.phase_in.combo1
execute if entity @s[scores={content_lock.attack_timer=110}] unless entity @s[tag=content_lock.zombified_piglin_princess.phase_in.combo1] run scoreboard players set @s content_lock.attack_timer 80
execute if entity @s[scores={content_lock.attack_timer=110}] at @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] run summon area_effect_cloud ~ ~ ~ {Duration:21,Tags:["content_lock.zombified_piglin_princess.phase_in.combo1.area"]}

execute if entity @s[scores={content_lock.attack_timer=100..110}] run particle cloud ~ ~ ~ 1 0.3 1 0.1 2 force @a
execute if entity @s[scores={content_lock.attack_timer=100..110}] run playsound block.stone.step hostile @a ~ ~ ~ 0.4 2

execute if entity @s[scores={content_lock.attack_timer=102}] run rotate @s facing entity @e[tag=content_lock.zombified_piglin_princess.phase_in.combo1.area,limit=1,sort=nearest] eyes
execute if entity @s[scores={content_lock.attack_timer=100}] run data merge storage content_lock:saved_stats {boss_speed:1}
execute if entity @s[scores={content_lock.attack_timer=100}] store result storage content_lock:saved_stats boss_speed double 0.01 run attribute @s movement_speed get 1000
execute if entity @s[scores={content_lock.attack_timer=100}] run function content_lock:mobs/bosses/zombified_piglin_princess/phase_in_motion with storage content_lock:saved_stats
execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s remove content_lock.zombified_piglin_princess.phase_in.combo1
execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players add @s content_lock.combo_counter 1
execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players add @s content_lock.boss_exhaustion 40
execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players set @s content_lock.attack_timer 118


execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=80}] run tag @s remove content_lock.zombified_piglin_princess.phase_in