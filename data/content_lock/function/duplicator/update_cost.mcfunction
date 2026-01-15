scoreboard players set @s content_lock.duplication_cost 0
scoreboard players set @s content_lock.temp2 1

execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:armor_level"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:weapon_level"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:aqua_affinity"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:bane_of_arthropods"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:blast_protection"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:breach"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:channeling"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:binding_curse"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:vanishing_curse"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:density"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:depth_strider"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:efficiency"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:feather_falling"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:fire_aspect"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:fire_protection"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:flame"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:fortune"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:frost_walker"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:impaling"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:infinity"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:knockback"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:looting"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:loyalty"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:luck_of_the_sea"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:lunge"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:lure"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:mending"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:multishot"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:piercing"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:power"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:projectile_protection"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:protection"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:punch"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:quick_charge"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:respiration"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:riptide"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:sharpness"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:silk_touch"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:smite"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:soul_speed"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:sweeping_edge"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:swift_sneak"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:thorns"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:unbreaking"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."minecraft:wind_burst"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:bloodthirst"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:cavalry"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:combat_knowledge"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:combo"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:corrosion"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:crashful"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:depth_meter"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:earthbound"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:earthquake"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:faura"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:flawless"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:immovable"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:iron_grip"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:last_breath"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:lightstruck"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:regrowth"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:sharpness2"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:splinter"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:touch_of_malice"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].components."minecraft:stored_enchantments"."content_lock:toughness"
execute if score @s content_lock.temp1 matches 1.. run function content_lock:duplicator/add_cost_loop

scoreboard players set @s content_lock.temp1 64
scoreboard players operation @s content_lock.duplication_cost *= @s content_lock.temp1
