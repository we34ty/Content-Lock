attribute @s movement_efficiency modifier add content_lock.basic_stats 0.25 add_value
attribute @s max_health modifier add content_lock.basic_stats -8 add_value
attribute @s scale modifier add content_lock.basic_stats -0.1 add_multiplied_base

function content_lock:player/passives/reset_level_stats

function content_lock:player/passives/check_stats_after_equipment_change

scoreboard players set @s content_lock.bleed_stacks 0
execute if entity @s[tag=content_lock.corrupted_meter_full] run function content_lock:player/effects/corruption
execute if score L content_lock.progression matches 2.. run scoreboard players add @s content_lock.corruption_meter 2
scoreboard players operation @s lsp.stamina = @s content_lock.max_stamina
scoreboard players set @s content_lock.health_percentage 100
scoreboard players set @s content_lock.health_percentage_old 100
