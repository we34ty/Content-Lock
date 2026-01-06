scoreboard players set @s content_lock.temp1 0
execute positioned ~-10 ~-10 ~-10 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=16,dy=16,dz=16] run scoreboard players set @s content_lock.temp1 1
execute positioned ~-5 ~-5 ~-5 if entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,dx=8,dy=8,dz=8] run scoreboard players set @s content_lock.temp1 2

execute if score @s content_lock.temp1 matches 0 store result score @s content_lock.temp2 run random value 1..5
execute if score @s content_lock.temp1 matches 1 store result score @s content_lock.temp2 run random value 6..7
execute if score @s content_lock.temp1 matches 2 store result score @s content_lock.temp2 run random value 8..11

#scoreboard players set @s content_lock.temp2 4
#execute store result score @s content_lock.temp2 run random value 1..5

#far
execute if score @s content_lock.temp2 matches 1 run tag @s add content_lock.wither.3_lasers
execute if score @s content_lock.temp2 matches 2 run tag @s add content_lock.wither.big_ball_to_rain
execute if score @s content_lock.temp2 matches 3 run tag @s add content_lock.wither.big_ball_direct
execute if score @s content_lock.temp2 matches 4 run tag @s add content_lock.wither.projectile_barrage_wall
execute if score @s content_lock.temp2 matches 5 run tag @s add content_lock.wither.charging_explosion_big_buff

#mid
execute if score @s content_lock.temp2 matches 6 run tag @s add content_lock.wither.charge_forward
execute if score @s content_lock.temp2 matches 7 run tag @s add content_lock.wither.flash_step

#close
execute if score @s content_lock.temp2 matches 8 run tag @s add content_lock.wither.charging_explosion
execute if score @s content_lock.temp2 matches 9 run tag @s add content_lock.wither.crush_from_above_all
execute if score @s content_lock.temp2 matches 10 run tag @s add content_lock.wither.triple_pushback_roar
execute if score @s content_lock.temp2 matches 11 run tag @s add content_lock.wither.area_effect_cloud
