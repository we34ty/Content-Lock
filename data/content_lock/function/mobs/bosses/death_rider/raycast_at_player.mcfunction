#execute facing entity @p feet run tp @s ^ ^ ^1
particle soul ~ ~ ~ 0 0 0 0.04 10 force @a
playsound entity.blaze.shoot hostile @a ~ ~ ~ 0.2 0.8
execute if entity @r[distance=0..2] as @a[distance=0..2] run damage @s 12 mob_attack by @e[tag=death_rider,limit=1,sort=nearest]
execute if entity @e[tag=death_rider_projectile_point,distance=0..1] run kill @e[tag=death_rider_projectile_point,distance=0..1]
execute unless entity @e[tag=death_rider_projectile_point,distance=0..40] run return 0
execute facing entity @e[tag=death_rider_projectile_point,limit=1,sort=nearest] eyes positioned ^ ^ ^1 run function content_lock:mobs/bosses/death_rider/raycast_at_player
