scoreboard players add @s content_lock.temp1 1
execute if score @s content_lock.temp1 matches 20 run function animated_java:weapons/remove/this

data merge storage content_lock:weapon_stats {xz:0.1,y:0.6,2xz:0.2,2y:1.2,UUID:[I;0,0,0,0],damage:0,damage_type:player_attack,rotation:0,distance:0,storage:"content_lock:weapon_stats"}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/uuid_id_load with storage content_lock:weapon_stats

function content_lock:player/weapons/entity/position with storage content_lock:weapon_stats

execute if score @s content_lock.temp1 matches 11 run playsound entity.player.attack.crit player @a ~ ~ ~ 1 1
execute if score @s content_lock.temp1 matches 11..12 rotated ~ -25 positioned ^ ^ ^0.5 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if score @s content_lock.temp1 matches 13..14 rotated ~ 0 positioned ^ ^ ^0.5 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if score @s content_lock.temp1 matches 15..17 rotated ~ 25 positioned ^ ^ ^0.5 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
