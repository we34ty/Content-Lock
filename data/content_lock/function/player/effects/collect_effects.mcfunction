#check if the player is on a mount to stop the effects from displaying
tag @e remove content_lock.vehicle
execute on vehicle run tag @s[type=#content_lock:rideable_healthbar] add content_lock.vehicle
execute at @s if entity @e[distance=0..5,tag=content_lock.vehicle] run return run tag @e remove content_lock.vehicle

#retrieve some values from the storage, such as stamina, to help with the performance,
#by not having to calculate the stamina display each tick
data merge storage content_lock:saved_stats {bleed:E004,frost:E009,corruption:E014,stamina:"",UUID:[I;0,0,0,0],storage:"content_lock:saved_stats",path:"stamina"}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
function content_lock:player/passives/storage/player_data/load_path with storage content_lock:saved_stats

#the "type" and "end" are cases for when the player doesn't have a resource pack enabled
#bleed
data merge storage content_lock:saved_stats {bleed_amount:"",value:"",type:"bleed_amount","end":"bleed"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.bleed_stacks
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
execute unless score @s content_lock.bleed_stacks matches 1.. run data merge storage content_lock:saved_stats {bleed:E048,bleed_amount:""}
execute if score @s content_lock.bleed_stacks matches 1..29 run data merge storage content_lock:saved_stats {bleed:E004}
execute if score @s content_lock.bleed_stacks matches 30..59 run data merge storage content_lock:saved_stats {bleed:E003}
execute if score @s content_lock.bleed_stacks matches 60..89 run data merge storage content_lock:saved_stats {bleed:E002}
execute if score @s content_lock.bleed_stacks matches 90..119 run data merge storage content_lock:saved_stats {bleed:E001}
execute if score @s content_lock.bleed_stacks matches 120.. run data merge storage content_lock:saved_stats {bleed:E000}

#"frost", currently called heat
data merge storage content_lock:saved_stats {frost_amount:"",value:"",type:"frost_amount","end":"frost"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.heat
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
#execute if score @s content_lock.frostbite_stacks matches 0 run data merge storage content_lock:saved_stats {frost:E009}
#execute if score @s content_lock.frostbite_stacks matches 0 run data merge storage content_lock:saved_stats {frost:E069}
execute if score @s content_lock.heat matches 0 run data merge storage content_lock:saved_stats {frost:E069,frost_amount:""}
execute if score @s content_lock.heat matches 1..199 run data merge storage content_lock:saved_stats {frost:E045}
execute if score @s content_lock.heat matches 200..349 run data merge storage content_lock:saved_stats {frost:E046}
execute if score @s content_lock.heat matches 350..499 run data merge storage content_lock:saved_stats {frost:E047}
execute if score @s content_lock.heat matches 500.. run data merge storage content_lock:saved_stats {frost:E044}

execute if score @s content_lock.frostbite_stacks matches -100..-1 run data merge storage content_lock:saved_stats {frost:E045}
execute if score @s content_lock.frostbite_stacks matches -200..-101 run data merge storage content_lock:saved_stats {frost:E046}
execute if score @s content_lock.frostbite_stacks matches -300..-201 run data merge storage content_lock:saved_stats {frost:E047}
execute if score @s content_lock.frostbite_stacks matches ..-301 run data merge storage content_lock:saved_stats {frost:E044}

execute if score @s content_lock.frostbite_stacks matches 1..100 run data merge storage content_lock:saved_stats {frost:E008}
execute if score @s content_lock.frostbite_stacks matches 101..200 run data merge storage content_lock:saved_stats {frost:E007}
execute if score @s content_lock.frostbite_stacks matches 201..300 run data merge storage content_lock:saved_stats {frost:E006}
execute if score @s content_lock.frostbite_stacks matches 301.. run data merge storage content_lock:saved_stats {frost:E005}

#corruption
data merge storage content_lock:saved_stats {corruption_amount:"",value:"",type:"corruption_amount","end":"corruption"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.corruption_meter
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
execute if score L content_lock.options.player.corruption matches 0 run data merge storage content_lock:saved_stats {corruption:E068,corruption_amount:""}
execute unless score L content_lock.progression matches 2.. unless score @s content_lock.corruption_meter matches 1.. run data merge storage content_lock:saved_stats {corruption:E068,corruption_amount:""}
execute if score L content_lock.options.player.corruption matches 1 if score L content_lock.progression matches 2.. unless score @s content_lock.corruption_meter matches 1.. run data merge storage content_lock:saved_stats {corruption:E014}
execute if score @s content_lock.corruption_meter matches 1..2 run data merge storage content_lock:saved_stats {corruption:E013}
execute if score @s content_lock.corruption_meter matches 3..4 run data merge storage content_lock:saved_stats {corruption:E012}
execute if score @s content_lock.corruption_meter matches 5..6 run data merge storage content_lock:saved_stats {corruption:E011}
execute if score @s content_lock.corruption_meter matches 7.. run data merge storage content_lock:saved_stats {corruption:E010}

#clock checks if player has a clock in their inventory and uses another function to chanege based on time of day
execute store result score @s content_lock.does_clock_display run clear @s clock 0
execute if predicate content_lock:underwater run scoreboard players set @s content_lock.does_clock_display 0
execute at @s unless dimension minecraft:overworld run scoreboard players set @s content_lock.does_clock_display 0
data merge storage content_lock:saved_stats {time:E059,time_amount:""}
data merge storage content_lock:saved_stats {nights_skipped:E060,nights_skipped_amount:""}
execute if score L content_lock.options.player.clock_display matches 1 if score @s content_lock.does_clock_display matches 1.. run function content_lock:player/passives/inventory_check/clock

#weapon mode
execute if entity @s[tag=content_lock.weapons.enabled] run data merge storage content_lock:saved_stats {weapon_mode:E080,weapon_mode_bool:"(attack mode) "}
execute unless entity @s[tag=content_lock.weapons.enabled] run data merge storage content_lock:saved_stats {weapon_mode:E081,weapon_mode_bool:""}
execute if entity @s[gamemode=spectator] run data merge storage content_lock:saved_stats {weapon_mode:E081,weapon_mode_bool:""}

#adds the "end"s to the values, so it's easier to distinguish what's what
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
function content_lock:player/effects/display with storage content_lock:saved_stats
