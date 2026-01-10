scoreboard players set @s content_lock.temp1 0
execute positioned ~-8 ~-8 ~-8 if entity @n[tag=content_lock.im_a_target,dx=16,dy=16,dz=16] run scoreboard players set @s content_lock.temp1 1
execute positioned ~-4 ~-4 ~-4 if entity @n[tag=content_lock.im_a_target,dx=8,dy=8,dz=8] run scoreboard players set @s content_lock.temp1 2

execute if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp1 matches 2 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:3}

#scoreboard players set @s content_lock.temp1 2
#scoreboard players set @s content_lock.temp2 3

#far
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.death_rider.spin_teleport
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.death_rider.rush_without_horse

#mid
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.death_rider.rush_on_horse
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.death_rider.throw_zombie_head

#close
execute if score @s content_lock.temp1 matches 2 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.death_rider.small_jump
execute if score @s content_lock.temp1 matches 2 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.death_rider.spin_around
execute if score @s content_lock.temp1 matches 2 if score @s content_lock.temp2 matches 3 run tag @s add content_lock.death_rider.under_punch