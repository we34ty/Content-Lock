#function content_lock:player_passives/parry/projectile_parry_rotate
execute if entity @e[tag=content_lock.enchanted_witch_quick_laser_aim,distance=0..1] run particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a
execute if entity @e[tag=content_lock.enchanted_witch_quick_laser_aim,distance=0..1] as @a[distance=0..3] run damage @s 6 magic by @e[tag=content_lock.enchanted_witch,limit=1]
execute if entity @e[tag=content_lock.enchanted_witch_quick_laser_aim,distance=0..1] run return 0
particle electric_spark ~ ~ ~ 0 0 0 1 15 force @a
particle enchant ~ ~ ~ 0 0 0 1 10 force @a
playsound item.trident.thunder hostile @a ~ ~ ~ 1 0.5
execute as @a[distance=0..1] run damage @s 6 magic by @e[tag=content_lock.enchanted_witch,limit=1]
execute facing entity @e[tag=content_lock.enchanted_witch_quick_laser_aim,limit=1,sort=nearest] feet positioned ^ ^ ^1 run function content_lock:mobs/bosses/enchanted_witch/quick_laser_raycast