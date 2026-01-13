scoreboard players set @s content_lock.temp1 0
execute positioned ~-7 ~-7 ~-7 if entity @n[tag=content_lock.im_a_target,dx=14,dy=14,dz=14] run scoreboard players set @s content_lock.temp1 1

execute unless entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run random value 1..3
execute if entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run random value 1..5
execute unless entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run random value 6..8
execute if entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run random value 6..10

#far
execute if score @s content_lock.temp2 matches 1 run tag @s add content_lock.second_officer.jump
execute if score @s content_lock.temp2 matches 2 run tag @s add content_lock.second_officer.send_projectile
execute if score @s content_lock.temp2 matches 3 run tag @s add content_lock.second_officer.stab_far

#close
execute if score @s content_lock.temp2 matches 6 run tag @s add content_lock.second_officer.left_right
execute if score @s content_lock.temp2 matches 7 run tag @s add content_lock.second_officer.spin_slash
execute if score @s content_lock.temp2 matches 8 run tag @s add content_lock.second_officer.up_down_long

