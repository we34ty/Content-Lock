execute if entity @s[scores={content_lock.fishing.is_fishing=1..}] run function content_lock:player/passives/fishing/begun_fishing

execute if entity @s[tag=content_lock.fishing,scores={content_lock.fishing.timer=..0}] at @s run function content_lock:player/passives/fishing/fish_hooked

execute if score @s content_lock.enchantment.lure matches 1.. run scoreboard players set @s content_lock.enchantment.lure 0
execute if entity @s[scores={content_lock.fishing.timer=-700..}] run scoreboard players remove @s content_lock.fishing.timer 1