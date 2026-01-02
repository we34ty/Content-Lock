execute as @e[tag=content_lock.fishing.fish] at @s unless entity @n[type=fishing_bobber,distance=..1] run tag @s add content_lock.fishing.fish.current

execute at @n[tag=content_lock.fishing.fish.current] run playsound entity.fishing_bobber.splash neutral @a ~ ~ ~ 0.5 0.7
execute at @n[tag=content_lock.fishing.fish.current] run particle splash ~ ~-0.1 ~ 0.2 0 0.2 1 20 normal @a

kill @e[tag=content_lock.fishing.fish.current]
kill @e[tag=content_lock.fishing.bobber]
tag @s remove content_lock.fishing.hooked_fish
tag @s remove content_lock.fishing