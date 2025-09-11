execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:23}

clear @s structure_void
advancement revoke @s from content_lock:checks/random_music_disc

execute if score @s content_lock.temp1 matches 1 run give @s minecraft:music_disc_13
execute if score @s content_lock.temp1 matches 2 run give @s minecraft:music_disc_cat
execute if score @s content_lock.temp1 matches 3 run give @s minecraft:music_disc_blocks
execute if score @s content_lock.temp1 matches 4 run give @s minecraft:music_disc_chirp
execute if score @s content_lock.temp1 matches 5 run give @s minecraft:music_disc_far
execute if score @s content_lock.temp1 matches 6 run give @s minecraft:music_disc_mall
execute if score @s content_lock.temp1 matches 7 run give @s minecraft:music_disc_mellohi
execute if score @s content_lock.temp1 matches 8 run give @s minecraft:music_disc_stal
execute if score @s content_lock.temp1 matches 9 run give @s minecraft:music_disc_strad
execute if score @s content_lock.temp1 matches 10 run give @s minecraft:music_disc_ward
execute if score @s content_lock.temp1 matches 11 run give @s minecraft:music_disc_11
execute if score @s content_lock.temp1 matches 12 run give @s minecraft:music_disc_wait
execute if score @s content_lock.temp1 matches 13 run give @s minecraft:music_disc_5
execute if score @s content_lock.temp1 matches 14 run give @s minecraft:music_disc_creator
execute if score @s content_lock.temp1 matches 16 run give @s minecraft:music_disc_otherside
execute if score @s content_lock.temp1 matches 17 run give @s minecraft:music_disc_pigstep
execute if score @s content_lock.temp1 matches 18 run give @s minecraft:music_disc_precipice
execute if score @s content_lock.temp1 matches 19 run give @s minecraft:music_disc_relic
execute if score @s content_lock.temp1 matches 20 run give @s minecraft:music_disc_mall[jukebox_playable="minecraft:enchanted_witch"]
execute if score @s content_lock.temp1 matches 21 run give @s minecraft:music_disc_strad[jukebox_playable="minecraft:iron_guardian"]
execute if score @s content_lock.temp1 matches 22 run give @s minecraft:music_disc_otherside[jukebox_playable="minecraft:death_rider"]
execute if score @s content_lock.temp1 matches 23 run give @s minecraft:music_disc_creator_music_box
