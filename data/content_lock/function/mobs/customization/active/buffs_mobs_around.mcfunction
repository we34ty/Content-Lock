execute at @s run particle enchant ~ ~ ~ 5 1 5 0.1 10 normal
execute at @s run particle enchanted_hit ~ ~ ~ 5 1 5 0.1 10 normal
execute at @s as @e[distance=0.1..10,type=#hostile] run function content_lock:mobs/customization/active/minor_buff_for_mobs