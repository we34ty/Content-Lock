execute if entity @e[type=fishing_bobber] as @e[type=fishing_bobber] at @s if block ~ ~ ~ #water_filled run tp @s ~ ~0.1 ~

execute if entity @r[scores={content_lock.fishing.is_fishing=1..}] as @a[scores={content_lock.fishing.is_fishing=1..}] run function content_lock:player/passives/fishing/begun_fishing

execute if entity @r[tag=content_lock.fishing,scores={content_lock.fishing.timer=..0}] as @a[tag=content_lock.fishing,scores={content_lock.fishing.timer=..0}] at @s run function content_lock:player/passives/fishing/fish_hooked


execute if entity @r[scores={content_lock.fishing.timer=-700..}] as @a[scores={content_lock.fishing.timer=-700..}] run scoreboard players remove @s content_lock.fishing.timer 1