tag @s[tag=!content_lock.boss] add content_lock.boss
scoreboard players set L content_lock.player_count_scaling 0
$execute as @a[distance=0..$(distance),gamemode=!spectator] unless score @s content_lock.time_since_death matches 0 run scoreboard players add L content_lock.player_count_scaling 1
$execute as @a[distance=0..$(distance),gamemode=!spectator] run tag @s add content_lock.turn_to_spectator_after_death
execute if score @s content_lock.player_count_scaling matches 2..4 if entity @s[tag=content_lock.corrupted_meter_full] run scoreboard players set @s content_lock.player_count_scaling 1
execute if score L content_lock.player_count_scaling matches 5.. run scoreboard players set @s content_lock.player_count_scaling 4
#execute if score L player_count_scaling matches 0 if entity @s[tag=dragons_apprentice_phase_1] run function content_lock:bosses/dragons_apprentice/despawn_attacks
#execute if score L player_count_scaling matches 0 if entity @s[tag=dragons_apprentice_phase_2] run function content_lock:bosses/dragons_apprentice/despawn_attacks2
execute if score L content_lock.player_count_scaling matches 0 unless entity @s[type=ender_dragon] unless entity @s[type=wither] run function content_lock:mobs/bosses/boss_despawn
execute if score L content_lock.player_count_scaling matches 0 if entity @s[type=wither,tag=content_lock.wither.initialized] run tag @s remove content_lock.wither.initialized
execute if score L content_lock.player_count_scaling matches 2 run effect give @s resistance 1 1 true
execute if score L content_lock.player_count_scaling matches 3 run effect give @s resistance 1 2 true
execute if score L content_lock.player_count_scaling matches 4.. run effect give @s resistance 1 3 true
