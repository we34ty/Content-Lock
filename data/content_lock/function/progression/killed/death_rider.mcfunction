##detects defeat of death rider, triggered by an achievement
advancement revoke @s only content_lock:checks/killed_boss/death_rider
##if you killed death rider, iron guardian and enchanted witch, increase the progression to 1 (triggers only once)
execute unless score content_lock.death_rider_killed content_lock.progression matches 1.. if score content_lock.enchanted_witch_killed content_lock.progression matches 1.. if score content_lock.iron_guardian_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/1
##globally saves the fact that the death rider had been defeated
scoreboard players add content_lock.death_rider_killed content_lock.progression 1
##stop music, just in case it keeps playing
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses

##the visible advancement
advancement grant @s only content_lock:combat/kill_death_rider