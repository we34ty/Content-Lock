##Adds the basic attributes back, since I have no idea whether Mojang has patched the issue where these don't persist after death
attribute @s movement_efficiency modifier remove content_lock.basic_stats
attribute @s max_health modifier add content_lock.basic_stats -8 add_value
attribute @s scale modifier add content_lock.basic_stats -0.1 add_multiplied_base

##Do the same with the ones from player level
function content_lock:player/passives/reset_level_stats

##As well as specific gear
function content_lock:player/passives/check_stats_after_equipment_change

##Removes some status effects as well as doing some weird things
scoreboard players set @s content_lock.bleed_stacks 0
tag @s remove content_lock.bleed_active
execute if entity @s[tag=content_lock.corrupted_meter_full] run function content_lock:player/effects/corruption
execute if score L content_lock.options.player.corruption matches 1 if score L content_lock.progression matches 2.. unless entity @s[tag=content_lock.corrupted_meter_full] unless entity @s[tag=content_lock.do_not_gain_corruption] run scoreboard players add @s content_lock.corruption_meter 2
tag @s remove content_lock.do_not_gain_corruption
scoreboard players operation @s lsp.stamina = @s content_lock.max_stamina
scoreboard players set @s content_lock.health_percentage 100
scoreboard players set @s content_lock.health_percentage_old 100
tag @s remove content_lock.bleed_active
scoreboard players set @s content_lock.heat 0
tag @s remove content_lock.heat_will_explode

##Checks if the death was during a multiplayer boss fight and acts accordingly
execute if score L content_lock.options.player.limited_boss_respawn matches 1.. at @s if entity @e[tag=content_lock.boss,distance=..40] run function content_lock:mobs/bosses/reduce_player_respawns
execute if score L content_lock.options.player.limited_boss_respawn matches 1.. at @s unless entity @e[tag=content_lock.boss,distance=..40] if entity @s[tag=content_lock.turn_to_spectator_after_death] run function content_lock:mobs/bosses/reduce_player_respawns
