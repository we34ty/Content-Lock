scoreboard players set @s content_lock.temp1 0
execute positioned ~-7 ~-7 ~-7 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=14,dy=14,dz=14] run scoreboard players set @s content_lock.temp1 1

execute if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:3}

#far
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.enchanted_witch.necromancy_attack
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.enchanted_witch.quick_laser
execute if score @s content_lock.temp1 matches 0 if score @s content_lock.temp2 matches 3 run tag @s add content_lock.enchanted_witch.frostbite_attack

#close
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 1 run tag @s add content_lock.enchanted_witch.teleport_away
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 2 run tag @s add content_lock.enchanted_witch.taze_attack
execute if score @s content_lock.temp1 matches 1 if score @s content_lock.temp2 matches 3 run tag @s add content_lock.enchanted_witch.control_flames

