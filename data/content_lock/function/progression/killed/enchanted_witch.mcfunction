advancement revoke @s only content_lock:checks/killed_boss/enchanted_witch
##if you killed death rider, iron guardian and enchanted witch, increase the progression to 1 (triggers only once)
execute unless score content_lock.enchanted_witch_killed content_lock.progression matches 1.. if score content_lock.death_rider_killed content_lock.progression matches 1.. if score content_lock.iron_guardian_killed content_lock.progression matches 1.. run function content_lock:progression/increase_progression/1
##globally saves the fact that the enchanted witch had been defeated
scoreboard players add content_lock.enchanted_witch_killed content_lock.progression 1
##stop music, just in case it keeps playing
execute as @a run function content_lock:mobs/bosses/music/stop_music_from_bosses
##remove the animated java rig, so it doesn't stay there without an AI
function animated_java:enchanted_witch/remove/all

##the visible advancement
advancement grant @s only content_lock:combat/kill_enchanted_witch