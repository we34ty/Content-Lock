tag @e remove content_lock.fishing.hooked_tag
tag @e remove content_lock.fishing.fish.current
tag @e remove content_lock.fishing.
##adds tags to both the player and their fishing hook
tag @s add content_lock.fishing.hooked_tag
execute as @e[type=fishing_bobber] at @s on origin if entity @s[tag=content_lock.fishing.hooked_tag] run tag @n[type=fishing_bobber,distance=..0.1] add content_lock.fishing.bobber
##if the fishing hook is on land and the player hasn't hooked a fish yet
execute unless entity @s[tag=content_lock.fishing.hooked_fish] if entity @n[tag=content_lock.fishing.bobber] at @n[tag=content_lock.fishing.bobber] unless block ~ ~-0.2 ~ #water_filled run return run function content_lock:player/passives/fishing/no_water
##if player has reeled their rod back before even hooking a fish
execute unless entity @s[tag=content_lock.fishing.hooked_fish] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/fish_free
##summons the 'fish' entity
execute unless entity @s[tag=content_lock.fishing.hooked_fish] at @n[tag=content_lock.fishing.bobber] run summon marker ~ ~ ~ {Tags:["content_lock.fishing.fish","content_lock.fishing.fish.current"]}
##randomizes the value which the fish uses to determine which way to rotate each tick
execute unless entity @s[tag=content_lock.fishing.hooked_fish] store result score @n[tag=content_lock.fishing.fish] content_lock.fishing.yaw run random value -180..180
tag @s add content_lock.fishing.hooked_fish

##function to use if player pulls the fishing hook out of the water too early
execute if entity @s[tag=content_lock.fishing.hooked_fish,tag=!content_lock.fishing.ready_to_catch] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/fish_free
##function to use if player pulls the fishing hiik out of the water at the right time
execute if entity @s[tag=content_lock.fishing.hooked_fish,tag=content_lock.fishing.ready_to_catch] unless entity @n[tag=content_lock.fishing.bobber] run return run function content_lock:player/passives/fishing/catch
#execute at @n[tag=content_lock.fishing.bobber] if block ~ ~-0.2 ~ #water_filled run return run tag @s remove content_lock.fishing

##make the fish nearest to you fishing hook the current one
execute at @n[tag=content_lock.fishing.bobber] run tag @n[tag=content_lock.fishing.fish] add content_lock.fishing.fish.current
##fish behaviour
execute as @n[tag=content_lock.fishing.fish.current] at @s run function content_lock:player/passives/fishing/fish

#summon area_effect_cloud ~ ~ ~ {Tags:[content_lock.fishing.look_fish],custom_particle:{type:"block",block_state:"air"},Duration:0}
#execute as @n[tag=content_lock.fishing.look_fish] at @s run rotate @s facing entity @n[tag=content_lock.fishing.fish.current] feet
#execute anchored eyes rotated as @n[tag=content_lock.fishing.look_fish] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^120 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run rotate @s ~ ~
#kill @e[type=area_effect_cloud,tag=content_lock.fishing.look_fish]

##calculations for getting player rotation
##Saves the player pitch to be used later
execute store result score @s content_lock.fishing.pitch run data get entity @s Rotation[1]
##Determines the difference between player yaw and the yaw of an armor stand which is looking directly at the fish
execute facing entity @n[tag=content_lock.fishing.fish.current] eyes rotated ~ 0 run summon armor_stand ~ ~ ~ {Tags:["content_lock.fishing.anchor"],NoGravity:1b,Invisible:1b,Invulnerable:1b,Small:1b}
execute as @n[tag=content_lock.fishing.anchor] facing entity @n[tag=content_lock.fishing.fish.current] feet rotated ~ 0 run rotate @s ~ ~
execute store result score @s content_lock.fishing.yaw run data get entity @s Rotation[0]
execute store result score @s content_lock.fishing.temp1 run data get entity @n[tag=content_lock.fishing.anchor] Rotation[0]
kill @e[tag=content_lock.fishing.anchor]
execute if score @s content_lock.fishing.yaw matches ..-1 run scoreboard players add @s content_lock.fishing.yaw 360
execute if score @s content_lock.fishing.temp1 matches ..-1 run scoreboard players add @s content_lock.fishing.temp1 360
scoreboard players operation @s content_lock.fishing.yaw -= @s content_lock.fishing.temp1

##checks how close is player's cursor to the 'fish' based purely on calculated yaw
##based on that increases/reduces their progess and fishing line's stress
execute unless score @s content_lock.fishing.yaw matches -15..15 run scoreboard players add @s content_lock.fishing.stress 2
execute unless score @s content_lock.fishing.yaw matches -15..15 run scoreboard players remove @s content_lock.fishing.progress 2
execute if score @s content_lock.fishing.yaw matches -10..10 run scoreboard players add @s content_lock.fishing.progress 1
execute if score @s content_lock.fishing.yaw matches -5..5 run scoreboard players add @s content_lock.fishing.progress 1

##checks the player's yaw to calculate how much 'stress' is going to be applied to the fishing line
##also increases the progress faster the higher you look. Capped at 20 degrees
execute if score @s content_lock.fishing.pitch matches ..-20 run scoreboard players add @s content_lock.fishing.stress 2
execute if score @s content_lock.fishing.pitch matches ..-20 run scoreboard players add @s content_lock.fishing.progress 3
##increases the fishing progress based on the 'lure' enchantment
scoreboard players operation @s content_lock.fishing.temp1 = @s content_lock.enchantment.lure
scoreboard players set @s content_lock.fishing.temp2 2
scoreboard players operation @s content_lock.fishing.temp1 /= @s content_lock.fishing.temp2
execute if score @s content_lock.fishing.pitch matches ..-20 if score @s content_lock.fishing.temp1 matches 1.. run scoreboard players operation @s content_lock.fishing.stress += @s content_lock.fishing.temp1
execute if score @s content_lock.fishing.pitch matches ..-20 if score @s content_lock.enchantment.lure matches 1.. run scoreboard players operation @s content_lock.fishing.progress += @s content_lock.enchantment.lure
execute if score @s content_lock.fishing.pitch matches -19..-6 run scoreboard players add @s content_lock.fishing.progress 1
execute if score @s content_lock.fishing.pitch matches -5..20 run scoreboard players remove @s content_lock.fishing.stress 1
execute if score @s content_lock.fishing.pitch matches 21.. run scoreboard players remove @s content_lock.fishing.progress 3
execute if score @s content_lock.fishing.pitch matches 21.. run scoreboard players remove @s content_lock.fishing.stress 4

execute if score @s content_lock.fishing.stress matches ..-1 run scoreboard players set @s content_lock.fishing.stress 0
execute if score @s content_lock.fishing.progress matches 321.. run scoreboard players set @s content_lock.fishing.progress 320
execute if entity @s[tag=!content_lock.fishing.ready_to_catch] if score @s content_lock.fishing.progress matches 300.. run playsound block.note_block.chime neutral @s ~ ~ ~ 1 2
execute if score @s content_lock.fishing.progress matches 300.. run tag @s add content_lock.fishing.ready_to_catch
execute if entity @s[tag=content_lock.fishing.ready_to_catch] if score @s content_lock.fishing.progress matches ..299 run tag @s remove content_lock.fishing.ready_to_catch

##turns the progress pointer around whenever it's in the middle
execute if entity @s[tag=!content_lock.fishing.switch_around] if score @s content_lock.fishing.progress matches 250.. run scoreboard players add @s content_lock.fishing.display 1
execute if score @s content_lock.fishing.progress matches 250.. run tag @s add content_lock.fishing.switch_around
execute if entity @s[tag=content_lock.fishing.switch_around] if score @s content_lock.fishing.progress matches ..249 run tag @s remove content_lock.fishing.switch_around

execute if score @s content_lock.fishing.stress matches 101.. run scoreboard players set @s content_lock.fishing.stress 100
##fish snaps the line if the stress get's too high
execute if score @s content_lock.fishing.stress matches 100.. run function content_lock:player/passives/fishing/fish_break
##fish escapes if the timer runs out
execute if score @s content_lock.fishing.timer matches ..-700 run function content_lock:player/passives/fishing/fish_free
execute if score @s content_lock.fishing.progress matches ..-1 run scoreboard players set @s content_lock.fishing.progress 0

##the function used to display the stress percent and progress bar
function content_lock:player/passives/fishing/display