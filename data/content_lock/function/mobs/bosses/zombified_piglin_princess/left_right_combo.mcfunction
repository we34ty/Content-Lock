execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.combo_counter 0
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 140
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100
execute if entity @s[scores={content_lock.attack_timer=100}] run scoreboard players add @s content_lock.combo_counter 1
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=100}] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total



execute if entity @s[scores={content_lock.attack_timer=20}] unless score @s content_lock.combo_counter matches 4.. if entity @e[tag=content_lock.im_a_target,type=#minecraft:boss_can_damage] positioned ~-4 ~-4 ~-4 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=8,dy=8,dz=8] run scoreboard players set @s content_lock.attack_timer 110
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=20}] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=10}] run tag @s remove content_lock.zombified_piglin_princess.left_right_combo