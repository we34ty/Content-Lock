execute if entity @s[tag=content_lock.boss] as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses
execute if entity @s[tag=content_lock.boss] at @s run function content_lock:mobs/bosses/drop_summoning_item
tp @s ~ -100 ~
#damage @s 99999 player_attack by L
#kill @s
data merge entity @s {Health:0}