advancement revoke @s only content_lock:checks/killed_boss/wither
#say lol
execute unless score content_lock.wither_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/2
scoreboard players add content_lock.wither_killed content_lock.progression 1
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses