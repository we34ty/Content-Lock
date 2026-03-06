advancement revoke @s only content_lock:checks/killed_boss/zombified_piglin_princess
##increases the progression to 3 (triggers only once)
execute unless score content_lock.zombified_piglin_princess_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/3
##globally saves the fact that the princess had been defeated
scoreboard players add content_lock.zombified_piglin_princess_killed content_lock.progression 1
##stop music, just in case it keeps playing
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses