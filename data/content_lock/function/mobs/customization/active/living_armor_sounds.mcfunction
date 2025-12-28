execute if entity @s[nbt={HurtTime:10s}] run playsound content_lock:entity.living_armor.damaged hostile @a ~ ~ ~ 0.5

execute if score L content_lock.timer1 matches 8 if predicate content_lock:is_moving run playsound content_lock:entity.living_armor.walk hostile @a ~ ~ ~ 0.5

execute if score L content_lock.timer1 matches 17 if predicate content_lock:true_random if predicate content_lock:true_random run playsound content_lock:entity.living_armor.idle hostile @a ~ ~ ~ 1