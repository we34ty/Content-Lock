scoreboard players add @s content_lock.attack_timer 1

data merge storage content_lock:weapon_stats {xz:0.5,y:0.1,storage:"content_lock:weapon_stats"}
execute if entity @s[tag=content_lock.weapons.hit3] run data merge storage content_lock:weapon_stats {xz:0.2,y:0.4,storage:"content_lock:weapon_stats"}
execute if entity @s[tag=content_lock.weapons.hit_running] run data merge storage content_lock:weapon_stats {xz:0.2,y:0.4,storage:"content_lock:weapon_stats"}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/storage/uuid_id/load with storage content_lock:weapon_stats
execute store result storage content_lock:weapon_stats yaw float 1.43 run data get storage content_lock:weapon_stats yaw

execute if score @s content_lock.attack_timer >= @s content_lock.weapons.weapon_visible_timer run return run function content_lock:player/weapons/entity/remove with storage content_lock:weapon_stats
function content_lock:player/weapons/entity/position with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 9..11 rotated ~50 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 12 rotated ~ 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 13..15 rotated ~-50 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 7..9 rotated ~-50 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 10..12 rotated ~ 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 13..15 rotated ~50 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit3] if score @s content_lock.attack_timer matches 7..9 rotated ~10 -20 positioned ^ ^ ^0.5 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit3] if score @s content_lock.attack_timer matches 10..11 rotated ~ 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 15..17 rotated ~-30 -20 positioned ^ ^ ^0.5 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 18 rotated ~ 0 positioned ^ ^ ^0.9 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats