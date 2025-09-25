particle bubble ~ ~ ~ 0.3 0.3 0.3 1 20 normal @a
playsound entity.zombie.converted_to_drowned neutral @a ~ ~ ~ 1 2
loot spawn ~ ~ ~ loot content_lock:enchantments/chest_obtainable
kill @s
tag @e[type=item,limit=1,sort=nearest] add content_lock.shimmered
