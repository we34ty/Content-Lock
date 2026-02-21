scoreboard players add @s content_lock.attack_timer 1
execute if score @s content_lock.attack_timer >= @s content_lock.weapons.weapon_visible_timer run return run function animated_java:weapons/remove/this

data merge storage content_lock:weapon_stats {xz:0.3,y:0.45,UUID:[I;0,0,0,0],damage:0,damage_type:player_attack,pitch:0,yaw:0,distance:0,storage:"content_lock:weapon_stats"}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/uuid_id_load with storage content_lock:weapon_stats

function content_lock:player/weapons/entity/position with storage content_lock:weapon_stats

execute if score @s content_lock.attack_timer matches 8..9 rotated ~ 10 positioned ^ ^ ^1 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats