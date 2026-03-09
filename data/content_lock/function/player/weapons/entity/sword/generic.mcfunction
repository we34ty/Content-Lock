scoreboard players add @s content_lock.attack_timer 1

data merge storage content_lock:weapon_stats {xz:0.5,y:0.1,UUID:[I;0,0,0,0],damage_type:"melee",pitch:0,yaw:0,distance:0,storage:"content_lock:weapon_stats",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
execute if entity @s[tag=content_lock.weapons.hit_running] run data merge storage content_lock:weapon_stats {xz:0.2,y:0.2,2xz:0.4,2y:0.4,UUID:[I;0,0,0,0],damage_type:"melee",pitch:0,yaw:0,distance:0,storage:"content_lock:weapon_stats",physical_damage:0,fire_damage:0,frost_damage:0,magic_damage:0,wither_damage:0,ender_damage:0,bleed_status:0,poison_status:0,corruption_status:0,wither_status:0,frostbite_status:0}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/storage/uuid_id/load with storage content_lock:weapon_stats
execute store result storage content_lock:weapon_stats yaw float 1.43 run data get storage content_lock:weapon_stats yaw

execute if score @s content_lock.attack_timer >= @s content_lock.weapons.weapon_visible_timer run return run function content_lock:player/weapons/entity/remove with storage content_lock:weapon_stats
function content_lock:player/weapons/entity/position with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 7..8 rotated ~50 0 positioned ^ ^ ^0.4 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 10..11 rotated ~50 0 positioned ^ ^ ^0.4 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if score @s content_lock.attack_timer matches 9 rotated ~ 0 positioned ^ ^ ^0.45 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit1] if score @s content_lock.attack_timer matches 10..11 rotated ~-50 0 positioned ^ ^ ^0.4 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit2] if score @s content_lock.attack_timer matches 7..8 rotated ~-50 0 positioned ^ ^ ^0.4 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats

execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 7..8 rotated ~ 0 positioned ^ ^ ^0.4 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 9..10 rotated ~ 0 positioned ^ ^ ^0.6 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats
execute if entity @s[tag=content_lock.weapons.hit_running] if score @s content_lock.attack_timer matches 11 rotated ~ 0 positioned ^ ^ ^1.3 run function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats