execute rotated ~ 0 positioned ^ ^ ^1 facing entity @s eyes run summon armor_stand ~ ~ ~ {Tags:["content_lock.weapons.angle"],Invisible:1b,NoGravity:1b,Marker:1b,Invulnerable:1b}
execute as @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5] at @s facing entity @p[tag=content_lock.weapons.attacking] eyes run tp @s ~ ~ ~ ~ ~
data merge storage content_lock:weapon_stats {pitch:0,distance:0}
execute store result storage content_lock:weapon_stats yaw int 1 run data get entity @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5] Rotation[1] -1000
kill @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5]
execute store result storage content_lock:weapon_stats distance float 0.0007 run function content_lock:math/tan with storage content_lock:weapon_stats

$data merge storage content_lock:weapon_stats {name:$(name),cooldown:$(cooldown),visible_timer:$(visible_timer),max_combo:$(max_combo),sound:$(sound),sound_pitch:$(sound_pitch),anims:$(anims)}
function content_lock:player/weapons/weapon_type_macro with storage content_lock:weapon_stats