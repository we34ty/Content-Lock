scoreboard players add @s content_lock.attack_timer 1
execute if score @s content_lock.attack_timer >= @s content_lock.weapons.weapon_visible_timer run return run function animated_java:weapons/remove/this

data merge storage content_lock:weapon_stats {xz:0.5,y:0.1,UUID:[I;0,0,0,0],damage:0,damage_type:player_attack,pitch:0,yaw:0,distance:0,storage:"content_lock:weapon_stats"}
execute if entity @s[tag=content_lock.weapons.hit_running] run data merge storage content_lock:weapon_stats {xz:0.2,y:0.2,2xz:0.4,2y:0.4,UUID:[I;0,0,0,0],damage:0,damage_type:player_attack,pitch:0,yaw:0,distance:0,storage:"content_lock:weapon_stats"}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/uuid_id_load with storage content_lock:weapon_stats

function content_lock:player/weapons/entity/position with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 6 rotated ~50 -10 positioned ^ ^ ^0.6 run function content_lock:player/weapons/entity/damage
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 7 rotated ~ 0 positioned ^ ^ ^0.7 run function content_lock:player/weapons/entity/damage
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 8..9 rotated ~-50 0 positioned ^ ^ ^0.6 run function content_lock:player/weapons/entity/damage

execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 7 rotated ~-50 0 positioned ^ ^ ^0.6 run function content_lock:player/weapons/entity/damage
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 8 rotated ~10 0 positioned ^ ^ ^0.7 run function content_lock:player/weapons/entity/damage
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 9 rotated ~70 0 positioned ^ ^ ^0.6 run function content_lock:player/weapons/entity/damage

execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 7..8 rotated ~50 20 positioned ^ ^ ^0.3 run function content_lock:player/weapons/entity/damage
execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 9..10 rotated ~15 0 positioned ^ ^ ^0.5 run function content_lock:player/weapons/entity/damage
execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 11 rotated ~ -10 positioned ^ ^ ^1.2 run function content_lock:player/weapons/entity/damage