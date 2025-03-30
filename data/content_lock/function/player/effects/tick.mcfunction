execute as @a run function content_lock:player/effects/collect_effects
execute if score L content_lock.timer1 matches 10 as @e run function content_lock:player/effects/activate_effects
execute if score L content_lock.timer1 matches 10 if entity @e[distance=0..40,tag=content_lock.bleed_active,limit=1,sort=random] as @e[tag=content_lock.bleed_active] run function content_lock:player/effects/bleed
