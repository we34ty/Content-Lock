tag @e remove content_lock.vehicle
execute on vehicle run tag @s[type=#minecraft:rideable_healthbar] add content_lock.vehicle
execute at @s if entity @e[distance=0..5,tag=content_lock.vehicle] run return run tag @e remove content_lock.vehicle

data merge storage content_lock:saved_stats {bleed:E004,frost:E009,corruption:E014,stamina:E016}

execute unless score @s content_lock.bleed_stacks matches 1.. run data merge storage content_lock:saved_stats {bleed:E048}
execute if score @s content_lock.bleed_stacks matches 1..29 run data merge storage content_lock:saved_stats {bleed:E004}
execute if score @s content_lock.bleed_stacks matches 30..59 run data merge storage content_lock:saved_stats {bleed:E003}
execute if score @s content_lock.bleed_stacks matches 60..89 run data merge storage content_lock:saved_stats {bleed:E002}
execute if score @s content_lock.bleed_stacks matches 90..119 run data merge storage content_lock:saved_stats {bleed:E001}
execute if score @s content_lock.bleed_stacks matches 120.. run data merge storage content_lock:saved_stats {bleed:E000}


#execute if score @s content_lock.frostbite_stacks matches 0 run data merge storage content_lock:saved_stats {frost:E009}
#execute if score @s content_lock.frostbite_stacks matches 0 run data merge storage content_lock:saved_stats {frost:E069}
execute if score @s content_lock.heat matches 0 run data merge storage content_lock:saved_stats {frost:E069}
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


execute if score L content_lock.options.player.corruption matches 0 run data merge storage content_lock:saved_stats {corruption:E068}
execute unless score L content_lock.progression matches 2.. unless score @s content_lock.corruption_meter matches 1.. run data merge storage content_lock:saved_stats {corruption:E068}
execute if score L content_lock.options.player.corruption matches 1 if score L content_lock.progression matches 2.. unless score @s content_lock.corruption_meter matches 1.. run data merge storage content_lock:saved_stats {corruption:E014}
execute if score @s content_lock.corruption_meter matches 1..2 run data merge storage content_lock:saved_stats {corruption:E013}
execute if score @s content_lock.corruption_meter matches 3..4 run data merge storage content_lock:saved_stats {corruption:E012}
execute if score @s content_lock.corruption_meter matches 5..6 run data merge storage content_lock:saved_stats {corruption:E011}
execute if score @s content_lock.corruption_meter matches 7.. run data merge storage content_lock:saved_stats {corruption:E010}

scoreboard objectives add tempmath dummy
scoreboard players set .scale tempmath 100
scoreboard players operation .stamina tempmath = @s lsp.stamina
scoreboard players operation .stamina tempmath *= .scale tempmath

scoreboard players operation .staminaMAX tempmath = @s content_lock.max_stamina

execute store result score .staminaRATIO tempmath run scoreboard players operation .stamina tempmath /= .staminaMAX tempmath

execute if score .staminaRATIO tempmath matches ..0 run data merge storage content_lock:saved_stats {stamina:E016}
execute if score .staminaRATIO tempmath matches 1..3 run data merge storage content_lock:saved_stats {stamina:E017}
execute if score .staminaRATIO tempmath matches 4..7 run data merge storage content_lock:saved_stats {stamina:E018}
execute if score .staminaRATIO tempmath matches 8..10 run data merge storage content_lock:saved_stats {stamina:E019}
execute if score .staminaRATIO tempmath matches 11..14 run data merge storage content_lock:saved_stats {stamina:E020}
execute if score .staminaRATIO tempmath matches 15..17 run data merge storage content_lock:saved_stats {stamina:E021}
execute if score .staminaRATIO tempmath matches 18..21 run data merge storage content_lock:saved_stats {stamina:E022}
execute if score .staminaRATIO tempmath matches 22..24 run data merge storage content_lock:saved_stats {stamina:E023}
execute if score .staminaRATIO tempmath matches 25..28 run data merge storage content_lock:saved_stats {stamina:E024}
execute if score .staminaRATIO tempmath matches 29..31 run data merge storage content_lock:saved_stats {stamina:E025}
execute if score .staminaRATIO tempmath matches 32..35 run data merge storage content_lock:saved_stats {stamina:E026}
execute if score .staminaRATIO tempmath matches 36..38 run data merge storage content_lock:saved_stats {stamina:E027}
execute if score .staminaRATIO tempmath matches 39..42 run data merge storage content_lock:saved_stats {stamina:E028}
execute if score .staminaRATIO tempmath matches 43..45 run data merge storage content_lock:saved_stats {stamina:E029}
execute if score .staminaRATIO tempmath matches 46..49 run data merge storage content_lock:saved_stats {stamina:E030}
execute if score .staminaRATIO tempmath matches 50..52 run data merge storage content_lock:saved_stats {stamina:E031}
execute if score .staminaRATIO tempmath matches 53..56 run data merge storage content_lock:saved_stats {stamina:E032}
execute if score .staminaRATIO tempmath matches 57..59 run data merge storage content_lock:saved_stats {stamina:E033}
execute if score .staminaRATIO tempmath matches 60..63 run data merge storage content_lock:saved_stats {stamina:E034}
execute if score .staminaRATIO tempmath matches 64..66 run data merge storage content_lock:saved_stats {stamina:E035}
execute if score .staminaRATIO tempmath matches 67..70 run data merge storage content_lock:saved_stats {stamina:E036}
execute if score .staminaRATIO tempmath matches 71..73 run data merge storage content_lock:saved_stats {stamina:E037}
execute if score .staminaRATIO tempmath matches 74..77 run data merge storage content_lock:saved_stats {stamina:E038}
execute if score .staminaRATIO tempmath matches 78..80 run data merge storage content_lock:saved_stats {stamina:E039}
execute if score .staminaRATIO tempmath matches 81..84 run data merge storage content_lock:saved_stats {stamina:E040}
execute if score .staminaRATIO tempmath matches 84..86 run data merge storage content_lock:saved_stats {stamina:E041}
execute if score .staminaRATIO tempmath matches 87..90 run data merge storage content_lock:saved_stats {stamina:E042}
execute if score .staminaRATIO tempmath matches 91..95 run data merge storage content_lock:saved_stats {stamina:E043}
execute if score .staminaRATIO tempmath matches 96.. run data merge storage content_lock:saved_stats {stamina:E015}
execute if score L content_lock.options.player.stamina matches 0 run data merge storage content_lock:saved_stats {stamina:E070}
execute if entity @s[gamemode=creative] run data merge storage content_lock:saved_stats {stamina:E070}
execute if entity @s[gamemode=spectator] run data merge storage content_lock:saved_stats {stamina:E070}

execute store result score @s content_lock.does_clock_display run clear @s clock 0
execute if predicate content_lock:underwater run scoreboard players set @s content_lock.does_clock_display 0
execute at @s unless dimension minecraft:overworld run scoreboard players set @s content_lock.does_clock_display 0
data merge storage content_lock:saved_stats {time:E059}
data merge storage content_lock:saved_stats {nights_skipped:E060}
execute if score L content_lock.options.player.clock_display matches 1 if score @s content_lock.does_clock_display matches 1.. run function content_lock:player/passives/inventory_check/clock

function content_lock:player/effects/display with storage content_lock:saved_stats
