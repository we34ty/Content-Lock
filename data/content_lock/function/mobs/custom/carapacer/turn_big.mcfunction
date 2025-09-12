execute if score @s content_lock.ai_timer matches 100 run data merge entity @e[tag=content_lock.carapacer.current,limit=1] {NoAI:1b}
execute if score @s content_lock.ai_timer matches 100 run function animated_java:carapacer/animations/transform__big_new/play
execute if score @s content_lock.ai_timer matches 100 run function animated_java:carapacer/animations/walk_small_new/stop
execute if score @s content_lock.ai_timer matches 100 run function animated_java:carapacer/animations/idle_small_new/stop
execute if score @s content_lock.ai_timer matches 100 run function animated_java:carapacer/animations/walk_big_new/stop
execute if score @s content_lock.ai_timer matches 100 run function animated_java:carapacer/animations/idle_big_new/stop


execute if score @s content_lock.ai_timer matches 160 run function animated_java:carapacer/animations/transform__big_new/stop
execute if score @s content_lock.ai_timer matches 160 run tag @s add content_lock.carapacer.has_a_target
execute if score @s content_lock.ai_timer matches 160 run data merge entity @e[tag=content_lock.carapacer.current,limit=1] {NoAI:0b}
execute if score @s content_lock.ai_timer matches 160 run tag @s remove content_lock.carapacer.moving


scoreboard players add @s content_lock.ai_timer 1
