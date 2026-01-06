execute rotated as @n[type=wither] run tp @s ^ ^ ^0.6 ~ ~

function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.5,distance:1,damage:6,damage_type:wither_skull}

execute unless block ~ ~ ~ #walkable run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1,distance:2,damage:6,damage_type:wither_skull}
execute unless block ~ ~ ~ #walkable run particle dust{color:4276551,scale:2} ~ ~ ~ 1 1 1 1 10 normal @a
execute unless block ~ ~ ~ #walkable run playsound entity.generic.explode hostile @a ~ ~ ~ 1 2
execute unless block ~ ~ ~ #walkable run kill @s