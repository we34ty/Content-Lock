scoreboard players set @s content_lock.temp1 0
execute positioned ~-10 ~-10 ~-10 if entity @n[tag=content_lock.im_a_target,dx=20,dy=20,dz=20] run scoreboard players set @s content_lock.temp1 1

execute unless entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run random value 1..3
execute if entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run random value 1..5
execute unless entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run random value 6..8
execute if entity @s[tag=content_lock.second_phase] if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run random value 6..10

#far
execute if score @s content_lock.temp2 matches 1 run tag @s add content_lock.third_officer.fireball
execute if score @s content_lock.temp2 matches 2 run tag @s add content_lock.third_officer.blue_fireball
execute if score @s content_lock.temp2 matches 3 run tag @s add content_lock.third_officer.blue_laser

#close
execute if score @s content_lock.temp2 matches 6 run tag @s add content_lock.third_officer.ram_into
execute if score @s content_lock.temp2 matches 7 run tag @s add content_lock.third_officer.stun_knockback
execute if score @s content_lock.temp2 matches 8 run tag @s add content_lock.third_officer.vortex_explode

