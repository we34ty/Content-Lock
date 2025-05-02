advancement revoke @s only content_lock:checks/killed_boss/zombified_piglin_princess
#say lol
execute unless score content_lock.zombified_piglin_princess_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/3
scoreboard players add content_lock.zombified_piglin_princess_killed content_lock.progression 1
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses