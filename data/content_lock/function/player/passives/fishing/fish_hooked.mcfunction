tag @e remove content_lock.fishing.hooked_tag
tag @e remove content_lock.fishing.fish.current
tag @e remove content_lock.fishing.bobber
tag @s add content_lock.fishing.hooked_tag
execute as @e[type=fishing_bobber] at @s on origin if entity @s[tag=content_lock.fishing.hooked_tag] run tag @n[type=fishing_bobber,distance=..0.1] add content_lock.fishing.bobber
execute unless entity @s[tag=content_lock.fishing.hooked_fish] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/fish_free
execute unless entity @s[tag=content_lock.fishing.hooked_fish] at @n[tag=content_lock.fishing.bobber] run summon marker ~ ~ ~ {Tags:["content_lock.fishing.fish","content_lock.fishing.fish.current"]}
execute unless entity @s[tag=content_lock.fishing.hooked_fish] store result score @n[tag=content_lock.fishing.fish] content_lock.fishing.yaw run random value -180..180
tag @s add content_lock.fishing.hooked_fish

execute if entity @s[tag=content_lock.fishing.hooked_fish] unless entity @n[tag=content_lock.fishing.bobber] if score @s content_lock.fishing.progress matches ..299 run return run function content_lock:player/passives/fishing/fish_free
execute if entity @s[tag=content_lock.fishing.hooked_fish] unless entity @n[tag=content_lock.fishing.bobber] if score @s content_lock.fishing.progress matches 300.. run return run function content_lock:player/passives/fishing/catch
#execute at @n[tag=content_lock.fishing.bobber] if block ~ ~-0.2 ~ #water_filled run return run tag @s remove content_lock.fishing

execute at @n[tag=content_lock.fishing.bobber] run tag @n[tag=content_lock.fishing.fish] add content_lock.fishing.fish.current
execute as @n[tag=content_lock.fishing.fish.current] at @s run function content_lock:player/passives/fishing/fish

execute store result score @s content_lock.fishing.pitch run data get entity @s Rotation[1]
execute facing entity @n[tag=content_lock.fishing.fish.current] eyes rotated ~ 0 run summon armor_stand ~ ~ ~ {Tags:["content_lock.fishing.anchor"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Small:1b}
execute as @n[tag=content_lock.fishing.anchor] facing entity @n[tag=content_lock.fishing.fish.current] feet rotated ~ 0 run rotate @s ~ ~
execute store result score @s content_lock.fishing.yaw run data get entity @s Rotation[0]
execute store result score @s content_lock.fishing.temp1 run data get entity @n[tag=content_lock.fishing.anchor] Rotation[0]
kill @e[tag=content_lock.fishing.anchor]
execute if score @s content_lock.fishing.yaw matches ..-1 run scoreboard players add @s content_lock.fishing.yaw 360
execute if score @s content_lock.fishing.temp1 matches ..-1 run scoreboard players add @s content_lock.fishing.temp1 360
scoreboard players operation @s content_lock.fishing.yaw -= @s content_lock.fishing.temp1

execute unless score @s content_lock.fishing.yaw matches -20..20 run scoreboard players add @s content_lock.fishing.stress 2
execute unless score @s content_lock.fishing.yaw matches -20..20 run scoreboard players remove @s content_lock.fishing.progress 2
execute if score @s content_lock.fishing.yaw matches -20..20 run scoreboard players add @s content_lock.fishing.progress 1
execute if score @s content_lock.fishing.yaw matches -10..10 run scoreboard players add @s content_lock.fishing.progress 1

execute if score @s content_lock.fishing.pitch matches ..-20 run scoreboard players add @s content_lock.fishing.stress 2
execute if score @s content_lock.fishing.pitch matches ..-20 run scoreboard players add @s content_lock.fishing.progress 3
execute if score @s content_lock.fishing.pitch matches -19..-6 run scoreboard players add @s content_lock.fishing.progress 1
execute if score @s content_lock.fishing.pitch matches -5..20 run scoreboard players remove @s content_lock.fishing.stress 1
execute if score @s content_lock.fishing.pitch matches 21.. run scoreboard players remove @s content_lock.fishing.progress 3
execute if score @s content_lock.fishing.pitch matches 21.. run scoreboard players remove @s content_lock.fishing.stress 4

execute if score @s content_lock.fishing.stress matches ..-1 run scoreboard players set @s content_lock.fishing.stress 0
execute if score @s content_lock.fishing.stress matches 100.. run function content_lock:player/passives/fishing/fish_break
execute if score @s content_lock.fishing.timer matches ..-200 run function content_lock:player/passives/fishing/fish_free
execute if score @s content_lock.fishing.progress matches ..-100 run function content_lock:player/passives/fishing/fish_free

function content_lock:player/passives/fishing/display