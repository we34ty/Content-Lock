scoreboard players add @s content_lock.timer1 1

tp @s ^ ^ ^1
particle flame ~ ~ ~ 0.2 0.2 0.2 0.1 1 normal @a
function content_lock:mobs/bosses/universal/damage_player_d {damage:10,half_distance:0.5,distance:1,damage_type:fireball}

execute unless block ~ ~ ~ #walkable run playsound entity.generic.explode hostile @a ~ ~ ~ 1 0.8
execute unless block ~ ~ ~ #walkable run particle flame ~ ~ ~ 0 0 0 1 30 force @a
execute unless block ~ ~ ~ #walkable run function content_lock:mobs/bosses/universal/damage_player_d {damage:10,half_distance:3,distance:6,damage_type:fireball}
execute unless block ~ ~ ~ #walkable run kill @s

execute if score @s content_lock.timer1 matches 40.. run kill @s