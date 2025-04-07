function content_lock:player_passives/parry/projectile_parry_rotate
scoreboard players add @s progression 1
execute if entity @s[scores={progression=80..}] run return 0
particle minecraft:dust{color:[0.584, 0.0, 0.78],scale: 1} ~ ~ ~ 0 0 0 0.5 10 force @a
execute if block ~ ~ ~ #walkable run tp @s ^ ^ ^1
execute unless block ~ ~ ~ #walkable run summon area_effect_cloud ~ ~ ~ {Duration:30,Tags:[ender_watcher_light_column]}
execute unless block ~ ~ ~ #walkable run return 0
#execute as @a[distance=0..1] run damage @s 10 magic by @e[tag=ender_watcher,limit=1]
execute as @s at @s run function content_lock:bosses/ender_watcher/ender_watcher_light_column_seed