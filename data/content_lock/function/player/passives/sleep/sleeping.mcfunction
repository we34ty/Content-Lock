execute if score L content_lock.options.player.nightmares matches 1 at @s unless predicate content_lock:is_dim_light unless biome ~ ~ ~ minecraft:mushroom_fields run return run function content_lock:player/passives/sleep/random_mob_on_sleep
execute if score L content_lock.options.player.nightmares matches 1 at @s unless predicate content_lock:under_roof unless biome ~ ~ ~ minecraft:mushroom_fields run return run function content_lock:player/passives/sleep/random_mob_on_sleep
#tag @e remove content_lock.kick_out_of_bed
#execute as @e[distance=..40,type=#hostile] on target run tag @s add content_lock.kick_out_of_bed
#execute if entity @s[tag=content_lock.kick_out_of_bed] run return run function content_lock:player/passives/sleep/random_mob_on_sleep
#execute at @s positioned ~ ~ ~-1 unless predicate content_lock:is_dim_light run return run function content_lock:player/passives/sleep/random_mob_on_sleep
#execute at @s positioned ~ ~ ~1 unless predicate content_lock:is_dim_light run return run function content_lock:player/passives/sleep/random_mob_on_sleep
#execute at @s positioned ~-1 ~ ~ unless predicate content_lock:is_dim_light run return run function content_lock:player/passives/sleep/random_mob_on_sleep
#execute at @s positioned ~1 ~ ~ unless predicate content_lock:is_dim_light run return run function content_lock:player/passives/sleep/random_mob_on_sleep
execute if entity @s[tag=!content_lock.level_up_menu_up,tag=!content_lock.level_up_menu_down] unless entity @r[tag=!content_lock.level_up_menu_down,tag=content_lock.level_up_menu_up] unless score L content_lock.nights_skipped_in_a_row matches 6.. run function content_lock:player/passives/sleep/disable_sleeping
execute if score L content_lock.options.player.leveling matches 1 unless entity @s[tag=content_lock.level_up_menu_up] run function content_lock:player/passives/sleep/level_up_menu
