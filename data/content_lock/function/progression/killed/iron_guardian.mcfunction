advancement revoke @s only content_lock:checks/killed_boss/iron_guardian
#say lol
execute unless score content_lock.iron_guardian_killed content_lock.progression matches 1.. if score content_lock.enchanted_witch_killed content_lock.progression matches 1.. if score content_lock.death_rider_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/1
scoreboard players add content_lock.iron_guardian_killed content_lock.progression 1
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses

advancement grant @s only content_lock:combat/kill_iron_guardian

kill @e[tag=content_lock.iron_guardian_pillar_shaft]
kill @e[tag=content_lock.iron_guardian_pillar_block]