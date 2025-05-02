execute if entity @s[nbt={HurtTime:10s}] run playsound minecraft:item.wolf_armor.damage hostile @a ~ ~ ~ 1 0.6

execute if score L content_lock.timer1 matches 8 if predicate content_lock:is_moving run playsound item.armor.equip_iron hostile @a ~ ~ ~ 0.3 1