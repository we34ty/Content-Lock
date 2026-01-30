scoreboard players add @s content_lock.timer1 1

tp @s ^ ^ ^1
execute unless entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run particle flame ~ ~ ~ 0.2 0.2 0.2 0.1 1 normal @a
execute if entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run particle soul_fire_flame ~ ~ ~ 0.2 0.2 0.2 0.1 1 normal @a
execute unless entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run function content_lock:mobs/bosses/universal/damage_player_d {damage:10,half_distance:0.5,distance:1,damage_type:fireball}
execute if entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run function content_lock:mobs/bosses/universal/damage_player_d {damage:7,half_distance:0.25,distance:0.5,damage_type:mob_projectile}
execute if entity @s[tag=content_lock.third_officer.fireball.projectile.blue] positioned ^ ^ ^-0.5 run function content_lock:mobs/bosses/universal/damage_player_d {damage:7,half_distance:0.25,distance:0.5,damage_type:mob_projectile}

execute unless block ~ ~ ~ #walkable run playsound entity.generic.explode hostile @a ~ ~ ~ 1 0.8
execute unless block ~ ~ ~ #walkable unless entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run particle flame ~ ~ ~ 0 0 0 1 30 force @a
execute unless block ~ ~ ~ #walkable if entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run particle soul_fire_flame ~ ~ ~ 0 0 0 1 30 force @a
execute unless block ~ ~ ~ #walkable unless entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run function content_lock:mobs/bosses/universal/damage_player_d {damage:10,half_distance:4,distance:8,damage_type:fireball}
execute unless block ~ ~ ~ #walkable if entity @s[tag=content_lock.third_officer.fireball.projectile.blue] run function content_lock:mobs/bosses/universal/damage_player_d {damage:7,half_distance:1.5,distance:3,damage_type:explosion}
execute unless block ~ ~ ~ #walkable run kill @s

execute if score @s content_lock.timer1 matches 80.. run kill @s