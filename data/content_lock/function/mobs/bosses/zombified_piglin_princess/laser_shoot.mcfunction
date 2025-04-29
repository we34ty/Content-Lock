scoreboard players add @s content_lock.temp1 1

particle flame ~ ~ ~ 0.3 0.3 0.3 0.01 4 force @a
execute if score @s content_lock.temp1 matches 40.. run return 0
execute unless block ~ ~ ~ #walkable run return 0
function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.5,distance:1,damage:4,damage_type:in_fire}
playsound block.furnace.fire_crackle hostile @a ~ ~ ~ 1 2

execute positioned ^ ^ ^0.5 run function content_lock:mobs/bosses/zombified_piglin_princess/laser_shoot