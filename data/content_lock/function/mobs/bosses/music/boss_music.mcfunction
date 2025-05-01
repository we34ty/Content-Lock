#stopsound @a[tag=!listening_to_music,distance=0..80] music
execute if score L content_lock.options.player.boss_music matches 0 run return 0

$execute as @a[distance=0..80,tag=!content_lock.listening_to_music] at @s run playsound $(song) music @s ~ ~ ~ 1 1
tag @a[distance=0..80,tag=!content_lock.listening_to_music] add content_lock.listening_to_music
#stopsound @a[tag=listening_to_music,distance=81..100] music
tag @a[tag=content_lock.listening_to_music,distance=81..100] remove content_lock.listening_to_music
tag @a[scores={content_lock.check_for_death=1..},tag=content_lock.listening_to_music] remove content_lock.listening_to_music
scoreboard players add @s content_lock.timer2 1
execute if score @s content_lock.timer2 matches 20 as @a[distance=0..80] run scoreboard players set @s content_lock.RestartMusic 1
$execute if score @r[distance=0..80] content_lock.time_playing_music_player matches $(duration).. run scoreboard players set @a[distance=0..80,scores={content_lock.time_playing_music_player=$(duration)..}] content_lock.RestartMusic 1