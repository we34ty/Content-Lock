execute unless entity @n[tag=content_lock.second_officer.temp_target] as @e[type=item_display,tag=aj.second_officer.root,distance=..40] rotated ~ 0 run tp @s ^ ^ ^-1 ~ 0
execute if entity @n[tag=content_lock.second_officer.temp_target] as @e[type=item_display,tag=aj.second_officer.root,distance=..40] facing entity @n[tag=content_lock.second_officer.temp_target] eyes rotated ~ 0 run tp @s ^ ^ ^-1 ~ 0

execute if entity @s[tag=content_lock.second_officer.attacking] run return 0
#movement check
execute if entity @s[tag=!content_lock.standing,nbt={Motion:[0.0,0.0,0.0]}] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/standing
execute if entity @s[tag=!content_lock.walking,nbt=!{Motion:[0.0,0.0,0.0]}] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/walking