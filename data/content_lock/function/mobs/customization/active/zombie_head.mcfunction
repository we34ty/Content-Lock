tag @e remove content_lock.vehicle
execute on vehicle run tag @s add content_lock.vehicle
execute rotated as @e[tag=content_lock.vehicle,tag=content_lock.death_rider.throw_zombie_head.entity,limit=1,sort=nearest] run rotate @s ~ 0
execute unless entity @e[tag=content_lock.vehicle,tag=content_lock.death_rider.throw_zombie_head.entity] run particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10 force
execute unless entity @e[tag=content_lock.vehicle,tag=content_lock.death_rider.throw_zombie_head.entity] run kill @s

execute if entity @s[tag=content_lock.death_rider.throw_zombie_head.in_motion] run function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.5,distance:1,damage:4,damage_type:mob_attack}
execute if entity @s[tag=content_lock.death_rider.throw_zombie_head.in_motion] if entity @e[tag=content_lock.vehicle,tag=content_lock.death_rider.throw_zombie_head.entity,limit=1,sort=nearest,nbt={OnGround:1b}] run tag @s remove content_lock.death_rider.throw_zombie_head.in_motion