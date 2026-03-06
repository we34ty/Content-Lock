advancement revoke @s only content_lock:checks/killed_boss/iron_guardian
##if you killed death rider, iron guardian and enchanted witch, increase the progression to 1 (triggers only once)
execute unless score content_lock.iron_guardian_killed content_lock.progression matches 1.. if score content_lock.enchanted_witch_killed content_lock.progression matches 1.. if score content_lock.death_rider_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/1
##globally saves the fact that the iron guardian had been defeated
scoreboard players add content_lock.iron_guardian_killed content_lock.progression 1
##stop music, just in case it keeps playing
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses

##the visible advancement
advancement grant @s only content_lock:combat/kill_iron_guardian

##get rid of all "projectiles", which could be left behind by the boss
kill @e[tag=content_lock.iron_guardian_pillar_shaft]
kill @e[tag=content_lock.iron_guardian_pillar_block]