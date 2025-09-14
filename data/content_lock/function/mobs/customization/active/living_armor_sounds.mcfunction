execute if entity @s[nbt={HurtTime:10s}] run playsound minecraft:entity.content_lock.living_armor.damaged hostile @a ~ ~ ~ 0.5

execute if score L content_lock.timer1 matches 8 if predicate content_lock:is_moving run playsound minecraft:entity.content_lock.living_armor.walk hostile @a ~ ~ ~ 0.5

execute if score L content_lock.timer1 matches 17 if predicate content_lock:true_random if predicate content_lock:true_random run playsound minecraft:entity.content_lock.living_armor.idle hostile @a ~ ~ ~ 1