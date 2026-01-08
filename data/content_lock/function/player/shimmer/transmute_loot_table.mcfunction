execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{"content_lock:unshimmerable":true}}}}] run return 0

particle bubble ~ ~ ~ 0.3 0.3 0.3 1 20 normal @a
playsound entity.zombie.converted_to_drowned neutral @a ~ ~ ~ 1 2

loot spawn ~ ~ ~ loot content_lock:recipes/material/shimmer
tag @s add content_lock.shimmered
data modify entity @s Item.components merge from entity @n[tag=!content_lock.shimmered,type=item,distance=..0.1] Item.components
data modify entity @s Item.id set from entity @n[tag=!content_lock.shimmered,type=item,distance=..0.1] Item.id
kill @n[tag=!content_lock.shimmered,type=item,distance=..0.1]