#stopsound @a[tag=!listening_to_music,distance=0..80] music
execute if score L content_lock.options.player.boss_music matches 0 run return 0

execute if entity @s[tag=!content_lock.playing_music] run stopwatch create content_lock:boss_music_timer
execute if entity @s[tag=!content_lock.playing_music] run stopwatch restart content_lock:boss_music_timer
tag @s add content_lock.playing_music

$execute as @a[distance=0..80,tag=!content_lock.listening_to_music] at @s run playsound $(song) music @s ~ ~ ~ 1 1
tag @a[distance=0..80,tag=!content_lock.listening_to_music] add content_lock.listening_to_music
#stopsound @a[tag=listening_to_music,distance=81..100] music
tag @a[tag=content_lock.listening_to_music,distance=81..100] remove content_lock.listening_to_music
tag @a[scores={content_lock.check_for_death=1..},tag=content_lock.listening_to_music] remove content_lock.listening_to_music

$execute if stopwatch content_lock:boss_music_timer $(duration).. run tag @a[distance=0..80] remove content_lock.listening_to_music
$execute if stopwatch content_lock:boss_music_timer $(duration).. run tag @s remove content_lock.playing_music