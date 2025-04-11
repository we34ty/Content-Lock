#execute if entity @e[tag=content_lock.boss,distance=0..80] run stopsound @s[tag=content_lock.listening_to_music] music
execute if entity @e[tag=content_lock.boss,distance=0..80] if entity @s[tag=content_lock.listening_to_music] run function content_lock:mobs/bosses/music/stop_music
execute if entity @e[tag=content_lock.boss,distance=0..80] run stopsound @s[tag=content_lock.listening_to_music] music music.content_lock.danger1
execute if entity @e[tag=content_lock.boss,distance=0..80] run stopsound @s[tag=content_lock.listening_to_music] music music.content_lock.danger2
execute if entity @e[tag=content_lock.boss,distance=0..80] run stopsound @s[tag=content_lock.listening_to_music] record
execute if entity @e[tag=content_lock.boss,distance=0..80] run return 0
#execute if entity @e[tag=content_lock.player_playing_music,distance=0..80] run return 0
execute if entity @s[tag=content_lock.listening_to_music] run function content_lock:mobs/bosses/music/stop_music_from_bosses
tag @s[tag=content_lock.listening_to_music] remove content_lock.listening_to_music