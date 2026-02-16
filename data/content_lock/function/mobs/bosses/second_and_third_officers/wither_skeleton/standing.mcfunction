execute as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/walk/stop
execute as @e[type=item_display,tag=aj.second_officer.root,distance=..40] run function animated_java:second_officer/animations/idle/play
tag @s remove content_lock.walking
tag @s add content_lock.standing