advancement revoke @s only content_lock:checks/killed_boss/wither
#say lol
execute unless score content_lock.wither_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/2
scoreboard players add content_lock.wither_killed content_lock.progression 1
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses

advancement grant @s only content_lock:combat/kill_wither

kill @e[tag=content_lock.wither.big_ball_to_rain.rain_pointer]
kill @e[tag=content_lock.wither.big_ball_to_rain.pointer]
kill @e[tag=content_lock.wither.3_lasers.pointer]
kill @e[tag=content_lock.wither.big_ball_direct.enemy_pointer]
kill @e[tag=content_lock.wither.big_ball_direct.pointer]
kill @e[tag=content_lock.wither.projectile_barrage_wall.projectile]
kill @e[tag=content_lock.wither.ai.charging_forward.pointer]
kill @e[tag=content_lock.wither.ai.close_shenanigans.pointer]
kill @e[tag=content_lock.wither.ai.move_out_of_range.pointer]
kill @e[tag=content_lock.wither.ai.stay_out_of_range.pointer]
kill @e[tag=content_lock.wither.ai.too_close.pointer]