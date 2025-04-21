attribute @s movement_efficiency modifier add content_lock.basic_stats 0.25 add_value
attribute @s max_health modifier add content_lock.basic_stats -10 add_value
attribute @s scale modifier add content_lock.basic_stats -0.1 add_multiplied_base

function content_lock:player/passives/reset_level_stats

function content_lock:player/passives/check_stats_after_equipment_change

scoreboard players set @s content_lock.bleed_stacks 0
#scoreboard players add @s content_lock.corruption_meter 90
scoreboard players operation @s lsp.stamina = @s content_lock.max_stamina
