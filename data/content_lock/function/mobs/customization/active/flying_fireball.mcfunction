tag @s add content_lock.thrown
execute at @s run tp @s ^ ^ ^0.15
execute at @s run particle small_flame ~ ~ ~ 0.1 0.1 0.1 0.02 10 force
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:8,damage_type:fireball}
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @r[dx=1,dy=1,dz=1] at @s run particle flame ~ ~ ~ 1 1 1 0.4 100 normal
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @r[dx=1,dy=1,dz=1] run playsound entity.generic.explode hostile @a ~ ~ ~ 2 1.4
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @r[dx=1,dy=1,dz=1] run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 1.4
execute at @s positioned ~-0.5 ~-0.5 ~-0.5 if entity @r[dx=1,dy=1,dz=1] run kill @s

execute at @s unless block ~ ~ ~ #walkable run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:8,damage_type:fireball}
execute at @s unless block ~ ~ ~ #walkable run particle flame ~ ~ ~ 1 1 1 0.4 100 normal
execute at @s unless block ~ ~ ~ #walkable run playsound entity.generic.explode hostile @a ~ ~ ~ 2 1.4
execute at @s unless block ~ ~ ~ #walkable run playsound block.fire.extinguish hostile @a ~ ~ ~ 2 1.4
execute at @s unless block ~ ~ ~ #walkable run kill @s
