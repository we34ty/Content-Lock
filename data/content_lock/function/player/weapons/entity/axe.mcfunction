scoreboard players add @s content_lock.attack_timer 1
execute if score @s content_lock.attack_timer matches 15 run function animated_java:weapons/remove/this

data merge storage content_lock:weapon_stats {Id:0,xz:0.4,y:0.4,2xz:0.8,2y:0.8,UUID:[I;0,0,0,0],damage:0,damage_type:player_attack,rotation:0,distance:0,storage:"content_lock:weapon_stats"}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/uuid_id_load with storage content_lock:weapon_stats

function content_lock:player/weapons/entity/position with storage content_lock:weapon_stats

execute if score @s content_lock.attack_timer matches 10 run playsound entity.player.attack.crit player @a ~ ~ ~ 1 1
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 11..12 rotated ~10 -25 positioned ^ ^ ^0.75 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 14 rotated ~-10 -25 positioned ^ ^ ^0.75 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if score @s content_lock.attack_timer matches 13 rotated ~ 0 positioned ^ ^ ^0.75 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 14 rotated ~-10 25 positioned ^ ^ ^0.75 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 11..12 rotated ~10 25 positioned ^ ^ ^0.75 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats