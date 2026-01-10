execute as @e run function content_lock:player/effects/activate_effects
execute if entity @n[tag=content_lock.bleed_active] as @e[tag=content_lock.bleed_active] run function content_lock:player/effects/bleed
execute if entity @n[type=!#entities,nbt=!{HurtTime:0s}] as @e[type=!#entities,nbt={HurtTime:1s}] if predicate content_lock:on_fire run function content_lock:mobs/passives/heat_accumulation
execute if entity @n[tag=content_lock.heat_will_explode,nbt={HurtTime:0s}] as @e[tag=content_lock.heat_will_explode,nbt={HurtTime:0s}] at @s run function content_lock:player/effects/heat_explode