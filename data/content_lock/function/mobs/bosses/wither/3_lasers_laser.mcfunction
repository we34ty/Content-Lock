scoreboard players add @s content_lock.timer2 1

particle dust{color:4276551,scale:3} ~ ~ ~ 0.5 0.5 0.5 1 2 force @a
particle soul ~ ~ ~ 0.5 0.5 0.5 0.05 1 normal @a
particle soul_fire_flame ~ ~ ~ 0.5 0.5 0.5 0.04 2 normal @a

function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.3,distance:0.6,damage:5,damage_type:wither_skull}

execute if score @s content_lock.timer2 matches ..40 positioned ^ ^ ^1 run function content_lock:mobs/bosses/wither/3_lasers_laser