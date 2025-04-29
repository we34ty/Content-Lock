scoreboard players set @s content_lock.temp1 0
execute positioned ~-8 ~-8 ~-8 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=16,dy=16,dz=16] run scoreboard players set @s content_lock.temp1 1
execute positioned ~-4 ~-4 ~-4 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=8,dy=8,dz=8] run scoreboard players set @s content_lock.temp1 2

execute if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp1 matches 2 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:3}

scoreboard players set @s content_lock.temp1 2
scoreboard players set @s content_lock.temp2 1

#far
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.zombified_piglin_princess.fireball
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.zombified_piglin_princess.rain_fireballs
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 3 run tag @s add content_lock.zombified_piglin_princess.phase_in

#mid
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.zombified_piglin_princess.laser
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.zombified_piglin_princess.bandit_bringer

#close
execute if score @s content_lock.temp1 matches 2 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.zombified_piglin_princess.left_right_combo
execute if score @s content_lock.temp1 matches 2 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.zombified_piglin_princess.volcanic_viper
execute if score @s content_lock.temp1 matches 2 if score @s content_lock.temp2 matches 3 run tag @s add content_lock.zombified_piglin_princess.gunflame