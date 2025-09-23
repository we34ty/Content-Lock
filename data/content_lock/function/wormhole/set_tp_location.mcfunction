data merge storage content_lock:saved_stats {x:0.0d,y:63.0d,z:0.0d}

execute store result score @s content_lock.stored_x run data get entity @s Pos[0]
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:200}
execute store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp2 matches 1 run scoreboard players operation @s content_lock.stored_x += @s content_lock.temp1
execute if score @s content_lock.temp2 matches 1 run scoreboard players add @s content_lock.stored_x 100
execute if score @s content_lock.temp2 matches 2 run scoreboard players operation @s content_lock.stored_x -= @s content_lock.temp1
execute if score @s content_lock.temp2 matches 2 run scoreboard players remove @s content_lock.stored_x 100
execute store result storage content_lock:saved_stats x double 1 run scoreboard players get @s content_lock.stored_x

execute store result score @s content_lock.stored_y run data get entity @s Pos[1]
execute store result storage content_lock:saved_stats y double 1 run scoreboard players get @s content_lock.stored_y

execute store result score @s content_lock.stored_z run data get entity @s Pos[2]
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:200}
execute store result score @s content_lock.temp2 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp2 matches 1 run scoreboard players operation @s content_lock.stored_z += @s content_lock.temp1
execute if score @s content_lock.temp2 matches 1 run scoreboard players add @s content_lock.stored_z 100
execute if score @s content_lock.temp2 matches 2 run scoreboard players operation @s content_lock.stored_z -= @s content_lock.temp1
execute if score @s content_lock.temp2 matches 2 run scoreboard players remove @s content_lock.stored_z 100
execute store result storage content_lock:saved_stats z double 1 run scoreboard players get @s content_lock.stored_z

execute as @e[tag=content_lock.wormhole.yet_to_be_teleported,limit=1,sort=nearest] at @s run function content_lock:wormhole/tp_second_point with storage content_lock:saved_stats