execute as @e[type=item_display,tag=aj.enchanted_witch.root,distance=..40] run tp @s ~ ~ ~ ~ 0

#movement check
execute if entity @s[tag=!content_lock.standing,nbt={Motion:[0.0,0.0,0.0]}] run function content_lock:mobs/bosses/enchanted_witch/standing
execute if entity @s[tag=!content_lock.walking,nbt=!{Motion:[0.0,0.0,0.0]}] run function content_lock:mobs/bosses/enchanted_witch/walking