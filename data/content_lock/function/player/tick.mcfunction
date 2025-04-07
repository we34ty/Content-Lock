execute unless score @r content_lock.content_lock_version = L content_lock.content_lock_version as @a unless score @s content_lock.content_lock_version = L content_lock.content_lock_version run function content_lock:player/check_player_update
execute as @a run function content_lock:player/check_damage_dealt_total
function content_lock:player/effects/tick
function content_lock:player/passives/hunger
function content_lock:player/passives/health_regen
function content_lock:player/items/tick
function content_lock:player/remove_bossbar
execute if score L content_lock.timer1 matches 4 as @a run function content_lock:player/levels/check_level
execute if entity @r[scores={content_lock.spoken_with_villager=1..}] as @a[scores={content_lock.spoken_with_villager=1..}] run function content_lock:player/check_villager_for_leveling

execute if entity @r[scores={content_lock.cavalry_counter=1}] as @a[scores={content_lock.cavalry_counter=1}] run function content_lock:player/enchantments/cavalry_disable
execute if entity @r[scores={content_lock.cavalry_counter=1..}] as @a[scores={content_lock.cavalry_counter=1..}] run scoreboard players remove @s content_lock.cavalry_counter 1

execute if entity @r[tag=content_lock.listening_to_music] as @a[tag=content_lock.listening_to_music] at @s run function content_lock:mobs/bosses/music/boss_music_stop

execute if entity @r[scores={content_lock.time_since_death=1}] as @a[scores={content_lock.time_since_death=1}] run function content_lock:player/passives/died
execute if entity @r[scores={content_lock.check_for_death=1..}] as @a[scores={content_lock.check_for_death=1..}] run scoreboard players set @s content_lock.check_for_death 0

execute if score L content_lock.timer1 matches 12 as @a run function content_lock:player/passives/round_health

execute if entity @r[tag=content_lock.iron_grip] as @a[tag=content_lock.iron_grip] run function content_lock:player/enchantments/iron_grip_disable
execute if entity @r[tag=content_lock.last_breath] as @a[tag=content_lock.last_breath] run function content_lock:player/enchantments/last_breath_disable

execute as @a run item modify entity @s player.cursor content_lock:remove_repair_cost

execute if entity @r[scores={LevelUp.ContentLock=1..}] as @a[scores={LevelUp.ContentLock=1..}] run function content_lock:player/levels/leveling_tellraw
execute if entity @r[scores={content_lock.cake_eaten=1..}] as @a[scores={content_lock.cake_eaten=1..}] run function content_lock:player/passives/eaten

execute if score L content_lock.timer1 matches 7 run function content_lock:player/ticks/tick7

