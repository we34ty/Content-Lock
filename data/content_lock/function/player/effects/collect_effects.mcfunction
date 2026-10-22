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
execute if score @s content_lock.bleed_stacks matches 1..2999 run data merge storage content_lock:saved_stats {bleed:E004}
execute if score @s content_lock.bleed_stacks matches 3000..5999 run data merge storage content_lock:saved_stats {bleed:E003}
execute if score @s content_lock.bleed_stacks matches 6000..8999 run data merge storage content_lock:saved_stats {bleed:E002}
execute if score @s content_lock.bleed_stacks matches 9000..11999 run data merge storage content_lock:saved_stats {bleed:E001}
execute if score @s content_lock.bleed_stacks matches 12000.. run data merge storage content_lock:saved_stats {bleed:E000}

data merge storage content_lock:saved_stats {frost_amount:"",value:"",type:"frost_amount","end":"frost"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.frostbite_stacks
execute unless score @s content_lock.frostbite_stacks matches 1.. run data merge storage content_lock:saved_stats {frost:E069,frost_amount:""}
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
execute if score @s content_lock.frostbite_stacks matches -3000..-1 run data merge storage content_lock:saved_stats {frost:E045}
execute if score @s content_lock.frostbite_stacks matches -6000..-3001 run data merge storage content_lock:saved_stats {frost:E046}
execute if score @s content_lock.frostbite_stacks matches -9000..-6001 run data merge storage content_lock:saved_stats {frost:E047}
execute if score @s content_lock.frostbite_stacks matches ..-9001 run data merge storage content_lock:saved_stats {frost:E044}

execute if score @s content_lock.frostbite_stacks matches 1..3000 run data merge storage content_lock:saved_stats {frost:E008}
execute if score @s content_lock.frostbite_stacks matches 3001..6000 run data merge storage content_lock:saved_stats {frost:E007}
execute if score @s content_lock.frostbite_stacks matches 6001..9000 run data merge storage content_lock:saved_stats {frost:E006}
execute if score @s content_lock.frostbite_stacks matches 9001.. run data merge storage content_lock:saved_stats {frost:E005}

#corruption
data merge storage content_lock:saved_stats {corruption_amount:"",value:"",type:"corruption_amount","end":"corruption"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.corruption_meter
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
execute unless score @s content_lock.corruption_meter matches 1.. run data merge storage content_lock:saved_stats {corruption:E068}
execute if score @s content_lock.corruption_meter matches 1..2400 run data merge storage content_lock:saved_stats {corruption:E014}
execute if score @s content_lock.corruption_meter matches 2401..4800 run data merge storage content_lock:saved_stats {corruption:E013}
execute if score @s content_lock.corruption_meter matches 4801..7200 run data merge storage content_lock:saved_stats {corruption:E012}
execute if score @s content_lock.corruption_meter matches 7201..9600 run data merge storage content_lock:saved_stats {corruption:E011}
execute if score @s content_lock.corruption_meter matches 9601.. run data merge storage content_lock:saved_stats {corruption:E010}

#wither
data merge storage content_lock:saved_stats {wither_amount:"",value:"",type:"wither_amount","end":"wither"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.wither_stacks
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
execute unless score @s content_lock.wither_stacks matches 1.. run data merge storage content_lock:saved_stats {wither:E094}
execute if score @s content_lock.wither_stacks matches 1..2000 run data merge storage content_lock:saved_stats {wither:E088}
execute if score @s content_lock.wither_stacks matches 2001..4000 run data merge storage content_lock:saved_stats {wither:E089}
execute if score @s content_lock.wither_stacks matches 4001..6000 run data merge storage content_lock:saved_stats {wither:E090}
execute if score @s content_lock.wither_stacks matches 6001..8000 run data merge storage content_lock:saved_stats {wither:E091}
execute if score @s content_lock.wither_stacks matches 8001..10000 run data merge storage content_lock:saved_stats {wither:E092}
execute if score @s content_lock.wither_stacks matches 10001.. run data merge storage content_lock:saved_stats {wither:E093}

#poison
data merge storage content_lock:saved_stats {poison_amount:"",value:"",type:"poison_amount","end":"poison"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.poison_stacks
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
execute unless score @s content_lock.poison_stacks matches 1.. run data merge storage content_lock:saved_stats {poison:E100}
execute if score @s content_lock.poison_stacks matches 1..2400 run data merge storage content_lock:saved_stats {poison:E095}
execute if score @s content_lock.poison_stacks matches 2401..4800 run data merge storage content_lock:saved_stats {poison:E096}
execute if score @s content_lock.poison_stacks matches 4801..7200 run data merge storage content_lock:saved_stats {poison:E097}
execute if score @s content_lock.poison_stacks matches 7201..9600 run data merge storage content_lock:saved_stats {poison:E098}
execute if score @s content_lock.poison_stacks matches 9601.. run data merge storage content_lock:saved_stats {poison:E099}

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

data merge storage content_lock:saved_stats {statuses:'{"translate":"space.-104","fallback":""}'}
#adds the "end"s to the values, so it's easier to distinguish what's what
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
function content_lock:player/effects/check_zeroes with storage content_lock:saved_stats
function content_lock:player/effects/display with storage content_lock:saved_stats
