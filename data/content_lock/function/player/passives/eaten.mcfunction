advancement revoke @s only content_lock:checks/eaten

execute if score @s content_lock.dried_kelp_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.potato_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.sweet_berries_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.glow_berries_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.melon_slice_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.tropical_fish_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_chicken_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_fish_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_salmon_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.poisonous_potato_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.beetroot_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.cookie_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.spider_eye_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_porkchop_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_beef_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_mutton_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.raw_rabbit_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 1
execute if score @s content_lock.carrot_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 2
execute if score @s content_lock.rotten_flesh_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 2
execute if score @s content_lock.chorus_fruit_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 2
execute if score @s content_lock.apple_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.bread_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.rabbit_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 4
execute if score @s content_lock.fish_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.baked_potato_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.salmon_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.mutton_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 4
execute if score @s content_lock.chicken_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 4
execute if score @s content_lock.honey_bottle_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.pufferfish_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.pumpkin_pie_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 5
execute if score @s content_lock.porkchop_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.steak_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 3
execute if score @s content_lock.suspicious_stew_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 5
execute if score @s content_lock.beetroot_soup_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 5
execute if score @s content_lock.mushroom_stew_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 5
execute if score @s content_lock.cake_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 6
execute if score @s content_lock.golden_carrot_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 7
execute if score @s content_lock.golden_apple_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 8
execute if score @s content_lock.rabbit_stew_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 9
execute if score @s content_lock.enchanted_golden_apple_eaten matches 1.. run scoreboard players set @s content_lock.healing_from_food 10

#execute if score @s content_lock.pufferfish_eaten matches 1.. run effect give @s nausea 10 0 false
#execute if score @s content_lock.pufferfish_eaten matches 1.. run effect give @s poison 10 0 false

#execute if score @s content_lock.spider_eye_eaten matches 1.. run effect give @s poison 10 0 false

#execute if score @s content_lock.golden_apple_eaten matches 1.. run effect give @s absorption 120 0 false

#execute if score @s content_lock.enchanted_golden_apple_eaten matches 1.. run effect give @s absorption 240 2 false
#execute if score @s content_lock.enchanted_golden_apple_eaten matches 1.. run effect give @s resistance 240 1 false
#execute if score @s content_lock.enchanted_golden_apple_eaten matches 1.. run effect give @s fire_resistance 240 0 false

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
#execute if score @s content_lock.chorus_fruit_eaten matches 1.. if score @s content_lock.temp1 matches 1 at @s run spreadplayers ~ ~ 0 16 false @s
#execute if score @s content_lock.chorus_fruit_eaten matches 1.. if score @s content_lock.temp1 matches 2 at @s run spreadplayers ~ ~ 0 16 under 60 false @s
#execute if score @s content_lock.chorus_fruit_eaten matches 1.. if score @s content_lock.temp1 matches 3 at @s run spreadplayers ~ ~ 0 16 under 328 false @s
#execute if score @s content_lock.chorus_fruit_eaten matches 1.. at @s run playsound minecraft:item.chorus_fruit.teleport player @s ~ ~ ~ 1 1

execute if score @s content_lock.sweet_berries_eaten matches 1.. run effect give @s speed 5 1 false

execute if score @s content_lock.cookie_eaten matches 1.. run effect give @s speed 10 1 false
execute if score @s content_lock.cookie_eaten matches 1.. run effect give @s haste 10 0 false

execute if score @s content_lock.glow_berries_eaten matches 1.. run effect give @s glowing 10 0 false
execute if score @s content_lock.glow_berries_eaten matches 1.. run effect give @s night_vision 10 0 false

#execute if score @s content_lock.poisonous_potato_eaten matches 1.. run effect give @s poison 10 0 false

execute if score @s content_lock.tropical_fish_eaten matches 1.. run effect give @s dolphins_grace 10 0 false
execute if score @s content_lock.tropical_fish_eaten matches 1.. run effect give @s water_breathing 10 0 false

execute if score @s content_lock.raw_fish_eaten matches 1.. run effect give @s water_breathing 8 0 false
execute if score @s content_lock.raw_salmon_eaten matches 1.. run effect give @s water_breathing 8 0 false

execute if score @s content_lock.rotten_flesh_eaten matches 1.. run effect give @s blindness 4 0 false

execute if score @s content_lock.melon_slice_eaten matches 1.. run effect give @s resistance 4 1 false

execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:300}
execute if score @s content_lock.dried_kelp_eaten matches 1.. if score @s content_lock.temp1 matches 1 run weather thunder
execute if score @s content_lock.dried_kelp_eaten matches 1.. run effect give @s conduit_power 4 0 false

scoreboard players set @s content_lock.dried_kelp_eaten 0
scoreboard players set @s content_lock.potato_eaten 0
scoreboard players set @s content_lock.sweet_berries_eaten 0
scoreboard players set @s content_lock.glow_berries_eaten 0
scoreboard players set @s content_lock.melon_slice_eaten 0
scoreboard players set @s content_lock.tropical_fish_eaten 0
scoreboard players set @s content_lock.raw_chicken_eaten 0
scoreboard players set @s content_lock.raw_fish_eaten 0
scoreboard players set @s content_lock.raw_salmon_eaten 0
scoreboard players set @s content_lock.poisonous_potato_eaten 0
scoreboard players set @s content_lock.beetroot_eaten 0
scoreboard players set @s content_lock.cookie_eaten 0
scoreboard players set @s content_lock.spider_eye_eaten 0
scoreboard players set @s content_lock.raw_porkchop_eaten 0
scoreboard players set @s content_lock.raw_beef_eaten 0
scoreboard players set @s content_lock.raw_mutton_eaten 0
scoreboard players set @s content_lock.raw_rabbit_eaten 0
scoreboard players set @s content_lock.carrot_eaten 0
scoreboard players set @s content_lock.rotten_flesh_eaten 0
scoreboard players set @s content_lock.chorus_fruit_eaten 0
scoreboard players set @s content_lock.apple_eaten 0
scoreboard players set @s content_lock.bread_eaten 0
scoreboard players set @s content_lock.rabbit_eaten 0
scoreboard players set @s content_lock.fish_eaten 0
scoreboard players set @s content_lock.baked_potato_eaten 0
scoreboard players set @s content_lock.salmon_eaten 0
scoreboard players set @s content_lock.mutton_eaten 0
scoreboard players set @s content_lock.chicken_eaten 0
scoreboard players set @s content_lock.honey_bottle_eaten 0
scoreboard players set @s content_lock.beetroot_soup_eaten 0
scoreboard players set @s content_lock.suspicious_stew_eaten 0
scoreboard players set @s content_lock.pumpkin_pie_eaten 0
scoreboard players set @s content_lock.porkchop_eaten 0
scoreboard players set @s content_lock.steak_eaten 0
scoreboard players set @s content_lock.golden_apple_eaten 0
scoreboard players set @s content_lock.cake_eaten 0
scoreboard players set @s content_lock.golden_carrot_eaten 0
scoreboard players set @s content_lock.enchanted_golden_apple_eaten 0
scoreboard players set @s content_lock.pufferfish_eaten 0
scoreboard players set @s content_lock.mushroom_stew_eaten 0
scoreboard players set @s content_lock.rabbit_stew_eaten 0


