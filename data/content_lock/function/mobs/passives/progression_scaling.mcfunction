execute if score L content_lock.progression matches 0 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:100}
execute if score L content_lock.progression matches 1 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:50}
execute if score L content_lock.progression matches 2 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:25}
execute if score L content_lock.progression matches 3 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:12}
execute if score L content_lock.progression matches 4 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:6}
execute if score L content_lock.progression matches 5 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score L content_lock.progression matches 6 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score L content_lock.progression matches 7 store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score L content_lock.progression matches 8.. store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:2}

execute unless score @s content_lock.temp1 matches 1 at @s if dimension minecraft:overworld if entity @s[y=0,dy=40] store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:100}
execute unless score @s content_lock.temp1 matches 1 at @s if dimension minecraft:overworld if entity @s[y=-30,dy=30] store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:33}
execute unless score @s content_lock.temp1 matches 1 at @s if dimension minecraft:overworld if entity @s[y=-50,dy=20] store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:17}
execute unless score @s content_lock.temp1 matches 1 at @s if dimension minecraft:overworld if entity @s[y=-64,dy=14] store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:6}


execute if score @s content_lock.temp1 matches 1 run function content_lock:mobs/passives/progression_scaling_detect_mob
execute unless score @s content_lock.temp1 matches 1 run tag @s add content_lock.progression_not_scaled
#data merge entity @s[tag=!content_lock.player_body] {HandDropChances:[0.0F,0.0F],ArmorDropChances:[0.0F,0.0F,0.0F,0.0F]}
