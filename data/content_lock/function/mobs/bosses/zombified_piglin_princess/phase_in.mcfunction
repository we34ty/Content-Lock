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
execute if entity @s[scores={content_lock.attack_timer=120..140}] at @e[tag=content_lock.zombified_piglin_princess.phase_in.area] run particle electric_spark ~ ~1.5 ~ 1 1.5 1 1 5 force
execute if entity @s[scores={content_lock.attack_timer=120..140}] at @e[tag=content_lock.zombified_piglin_princess.phase_in.area] run playsound block.furnace.fire_crackle hostile @a ~ ~ ~ 1 1
execute if entity @s[scores={content_lock.attack_timer=120}] run tp @s @e[tag=content_lock.zombified_piglin_princess.phase_in.area,limit=1,sort=nearest]

execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=120}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=20}] run tag @s remove content_lock.zombified_piglin_princess.phase_in