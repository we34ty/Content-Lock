execute store result score @s content_lock.weapons.xz run data get storage content_lock:weapon_stats xz 1000
execute store result score @s content_lock.weapons.y run data get storage content_lock:weapon_stats y 1000

data merge storage content_lock:weapon_stats {2xy:0,2y:0,xz_length:0,y_length:0}

scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s content_lock.weapons.xz *= @s content_lock.temp1
scoreboard players operation @s content_lock.weapons.y *= @s content_lock.temp1
execute store result storage content_lock:weapon_stats 2xz float 0.001 run scoreboard players get @s content_lock.weapons.xz
execute store result storage content_lock:weapon_stats 2y float 0.001 run scoreboard players get @s content_lock.weapons.y

scoreboard players set @s content_lock.temp1 1000
scoreboard players operation @s content_lock.weapons.xz /= @s content_lock.temp1
scoreboard players operation @s content_lock.weapons.y /= @s content_lock.temp1
scoreboard players add @s content_lock.weapons.xz 1
scoreboard players add @s content_lock.weapons.y 1
execute store result storage content_lock:weapon_stats xz_length float 1 run scoreboard players get @s content_lock.weapons.xz
execute store result storage content_lock:weapon_stats y_length float 1 run scoreboard players get @s content_lock.weapons.y

function content_lock:player/weapons/entity/damage_post_calculations with storage content_lock:weapon_stats
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) as @e[type=!#entities,dx=$(2xz),dz=$(2xz),dy=$(2y),nbt=!{UUID:$(UUID)}] 