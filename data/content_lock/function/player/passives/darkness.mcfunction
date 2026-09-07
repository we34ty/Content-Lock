execute if dimension overworld if predicate content_lock:so_real_for_dark unless block ~ ~ ~ #water_filled if block ~ ~ ~ #walkable run scoreboard players add @s content_lock.dark_timer 1
execute unless predicate content_lock:so_real_for_dark run scoreboard players set @s content_lock.dark_timer 0
execute unless dimension overworld run scoreboard players set @s content_lock.dark_timer 0
execute if score @s content_lock.dark_timer matches 100.. run effect give @s minecraft:darkness 2 0 true
execute if score @s content_lock.dark_timer matches 150 run function content_lock:player/passives/random_sounds/dark_sound
execute if score @s content_lock.dark_timer matches 200.. run function content_lock:player/passives/random_sounds/dark_sound
execute if score @s content_lock.dark_timer matches 250 run summon zombie ~ ~-1 ~
execute if score @s content_lock.dark_timer matches 250 run scoreboard players set @s content_lock.dark_timer 0
execute if score @s content_lock.dark_sound_cooldown matches 1.. run scoreboard players remove @s content_lock.dark_sound_cooldown 1
