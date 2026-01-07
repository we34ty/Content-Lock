#$execute positioned ~-3 ~-1 ~-3 at @e[type=player,dx=6,dz=2,dy=3] run summon small_fireball ~ ~2 ~ {Fire:$(fire),Motion:[0.0,-0.001,0.0],acceleration_power:0.001}
$execute positioned ~-3 ~-1 ~-3 as @e[type=!#entities,type=!player,dx=6,dz=2,dy=3] unless predicate content_lock:on_fire run data merge entity @s {Fire:$(fire)}
$execute positioned ~-3 ~-1 ~-3 as @e[type=!#entities,dx=6,dz=2,dy=3] run damage @s $(damage) content_lock:heat by @n[tag=content_lock.heat_will_explode]
