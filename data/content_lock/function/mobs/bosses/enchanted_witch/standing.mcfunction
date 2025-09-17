execute as @e[type=item_display,tag=aj.enchanted_witch.root,distance=..40] run function animated_java:enchanted_witch/animations/walk/stop
execute as @e[type=item_display,tag=aj.enchanted_witch.root,distance=..40] run function animated_java:enchanted_witch/animations/idle/play
tag @s remove content_lock.walking
tag @s add content_lock.standing