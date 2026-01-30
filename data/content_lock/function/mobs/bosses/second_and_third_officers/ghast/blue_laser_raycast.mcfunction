scoreboard players add @s content_lock.temp1 1

particle soul_fire_flame ~ ~ ~ 0.2 0.2 0.2 0.02 4 normal @a
particle dust_color_transition{from_color:9437439,to_color:62207,scale:1} ~ ~ ~ 0.2 0.2 0.2 0.02 10 force @a

function content_lock:mobs/bosses/universal/damage_player_d {damage:7,half_distance:0.25,distance:0.5,damage_type:mob_projectile}
execute positioned ^ ^ ^-0.5 run function content_lock:mobs/bosses/universal/damage_player_d {damage:7,half_distance:0.25,distance:0.5,damage_type:mob_projectile}

execute unless block ~ ~ ~ #walkable run return run kill @n[type=marker,tag=content_lock.third_officer.blue_laser.target]
execute if score @s content_lock.temp1 matches 80.. run return run kill @n[type=marker,tag=content_lock.third_officer.blue_laser.target]

execute rotated as @s positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_laser_raycast