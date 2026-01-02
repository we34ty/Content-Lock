execute as @e[tag=content_lock.fishing.fish] at @s unless entity @n[tag=content_lock.fishing.bobber,distance=..0.3] run tag @s add content_lock.fishing.fish.current
execute at @n[tag=content_lock.fishing.fish.current] run loot spawn ~ ~ ~ fish gameplay/fishing ~ ~-0.2 ~
execute at @n[tag=content_lock.fishing.fish.current] as @e[type=item,distance=..1] run function content_lock:player/passives/fishing/loot

execute at @n[tag=content_lock.fishing.fish.current] run particle splash ~ ~-0.1 ~ 0.2 0 0.2 1 20 normal @a
execute at @n[tag=content_lock.fishing.fish.current] run playsound entity.tropical_fish.hurt neutral @a ~ ~ ~ 1 1

kill @e[tag=content_lock.fishing.fish.current]
tag @s remove content_lock.fishing.hooked_fish
tag @s remove content_lock.fishing

