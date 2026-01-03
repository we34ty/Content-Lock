tag @e remove content_lock.fishing.hooked_tag
tag @e remove content_lock.fishing.fish.current
tag @e remove content_lock.fishing.bobber
tag @s add content_lock.fishing.hooked_tag
execute as @e[type=fishing_bobber] at @s on origin if entity @s[tag=content_lock.fishing.hooked_tag] run tag @n[type=fishing_bobber,distance=..0.1] add content_lock.fishing.bobber
execute unless entity @s[tag=content_lock.fishing.hooked_fish] if entity @n[tag=content_lock.fishing.bobber] at @n[tag=content_lock.fishing.bobber] unless block ~ ~-0.2 ~ #water_filled run return run function content_lock:player/passives/fishing/no_water
execute unless entity @s[tag=content_lock.fishing.hooked_fish] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/fish_free
execute unless entity @s[tag=content_lock.fishing.hooked_fish] at @n[tag=content_lock.fishing.bobber] run summon marker ~ ~ ~ {Tags:["content_lock.fishing.fish","content_lock.fishing.fish.current"]}
execute unless entity @s[tag=content_lock.fishing.hooked_fish] store result score @n[tag=content_lock.fishing.fish] content_lock.fishing.yaw run random value -180..180
tag @s add content_lock.fishing.hooked_fish

execute if entity @s[tag=content_lock.fishing.hooked_fish,tag=!content_lock.fishing.ready_to_catch] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/fish_free
execute if entity @s[tag=content_lock.fishing.hooked_fish,tag=content_lock.fishing.ready_to_catch] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/catch
#execute at @n[tag=content_lock.fishing.bobber] if block ~ ~-0.2 ~ #water_filled run return run tag @s remove content_lock.fishing

execute at @n[tag=content_lock.fishing.bobber] run tag @n[tag=content_lock.fishing.fish] add content_lock.fishing.fish.current
execute as @n[tag=content_lock.fishing.fish.current] at @s run function content_lock:player/passives/fishing/fish

#summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.fishing.look_fish],custom_particle:{type:"block",block_state:"air"},Duration:0}
#execute as @n[tag=content_lock.fishing.look_fish] at @s run rotate @s facing entity @n[tag=content_lock.fishing.fish.current] feet
#execute anchored eyes rotated as @n[tag=content_lock.fishing.look_fish] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^120 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run rotate @s ~ ~
#kill @e[type=area_effect_cloud,tag=content_lock.fishing.look_fish]

execute store result score @s content_lock.fishing.pitch run data get entity @s Rotation[1]
execute facing entity @n[tag=content_lock.fishing.fish.current] eyes rotated ~ 0 run summon armor_stand ~ ~ ~ {Tags:["content_lock.fishing.anchor"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Small:1b}
execute as @n[tag=content_lock.fishing.anchor] facing entity @n[tag=content_lock.fishing.fish.current] feet rotated ~ 0 run rotate @s ~ ~
execute store result score @s content_lock.fishing.yaw run data get entity @s Rotation[0]
execute store result score @s content_lock.fishing.temp1 run data get entity @n[tag=content_lock.fishing.anchor] Rotation[0]
kill @e[tag=content_lock.fishing.anchor]
execute if score @s content_lock.fishing.yaw matches ..-1 run scoreboard players add @s content_lock.fishing.yaw 360
execute if score @s content_lock.fishing.temp1 matches ..-1 run scoreboard players add @s content_lock.fishing.temp1 360
scoreboard players operation @s content_lock.fishing.yaw -= @s content_lock.fishing.temp1

execute unless score @s content_lock.fishing.yaw matches -15..15 run scoreboard players add @s content_lock.fishing.stress 2
execute unless score @s content_lock.fishing.yaw matches -15..15 run scoreboard players remove @s content_lock.fishing.progress 2
execute if score @s content_lock.fishing.yaw matches -10..10 run scoreboard players add @s content_lock.fishing.progress 1
execute if score @s content_lock.fishing.yaw matches -5..5 run scoreboard players add @s content_lock.fishing.progress 1

execute if score @s content_lock.fishing.pitch matches ..-20 run scoreboard players add @s content_lock.fishing.stress 2
execute if score @s content_lock.fishing.pitch matches ..-20 run scoreboard players add @s content_lock.fishing.progress 3
execute if score @s content_lock.fishing.pitch matches -19..-6 run scoreboard players add @s content_lock.fishing.progress 1
execute if score @s content_lock.fishing.pitch matches -5..20 run scoreboard players remove @s content_lock.fishing.stress 1
execute if score @s content_lock.fishing.pitch matches 21.. run scoreboard players remove @s content_lock.fishing.progress 3
execute if score @s content_lock.fishing.pitch matches 21.. run scoreboard players remove @s content_lock.fishing.stress 4

execute if score @s content_lock.fishing.stress matches ..-1 run scoreboard players set @s content_lock.fishing.stress 0
execute if score @s content_lock.fishing.progress matches 321.. run scoreboard players set @s content_lock.fishing.progress 320
execute if entity @s[tag=!content_lock.fishing.ready_to_catch] if score @s content_lock.fishing.progress matches 300.. run playsound block.note_block.chime neutral @s ~ ~ ~ 1 2
execute if score @s content_lock.fishing.progress matches 300.. run tag @s add content_lock.fishing.ready_to_catch
execute if entity @s[tag=content_lock.fishing.ready_to_catch] if score @s content_lock.fishing.progress matches ..299 run tag @s remove content_lock.fishing.ready_to_catch

execute if entity @s[tag=!content_lock.fishing.switch_around] if score @s content_lock.fishing.progress matches 250.. run scoreboard players add @s content_lock.fishing.display 1
execute if score @s content_lock.fishing.progress matches 250.. run tag @s add content_lock.fishing.switch_around
execute if entity @s[tag=content_lock.fishing.switch_around] if score @s content_lock.fishing.progress matches ..249 run tag @s remove content_lock.fishing.switch_around

execute if score @s content_lock.fishing.stress matches 100.. run function content_lock:player/passives/fishing/fish_break
execute if score @s content_lock.fishing.timer matches ..-700 run function content_lock:player/passives/fishing/fish_free
execute if score @s content_lock.fishing.progress matches ..-1 run scoreboard players set @s content_lock.fishing.progress 0

function content_lock:player/passives/fishing/display