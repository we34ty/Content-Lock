execute unless score @r content_lock.content_lock_version = L content_lock.content_lock_version as @a unless score @s content_lock.content_lock_version = L content_lock.content_lock_version run function content_lock:player/check_player_update
execute as @a run function content_lock:player/check_damage_dealt_total
function content_lock:player/effects/tick
function content_lock:player/passives/hunger
function content_lock:player/passives/health_regen
function content_lock:player/items/tick
function content_lock:player/remove_bossbar
function content_lock:player/passives/fishing/tick
execute if score L content_lock.timer1 matches 4 as @a run function content_lock:player/levels/check_level
execute as @a run function content_lock:player/levels/check_triggers
execute if entity @r[scores={content_lock.spoken_with_villager=1..}] as @a[scores={content_lock.spoken_with_villager=1..}] run function content_lock:player/passives/check_for_villager_spoken

execute if entity @r[scores={content_lock.cavalry_counter=1}] as @a[scores={content_lock.cavalry_counter=1}] run function content_lock:player/enchantments/cavalry_disable
execute if entity @r[scores={content_lock.cavalry_counter=1..}] as @a[scores={content_lock.cavalry_counter=1..}] run scoreboard players remove @s content_lock.cavalry_counter 1

execute if entity @r[tag=content_lock.listening_to_music] as @a[tag=content_lock.listening_to_music] at @s run function content_lock:mobs/bosses/music/boss_music_stop

execute if entity @r[scores={content_lock.time_since_death=1}] as @a[scores={content_lock.time_since_death=1}] run function content_lock:player/passives/died
execute if entity @r[scores={content_lock.check_for_death=1..}] as @a[scores={content_lock.check_for_death=1..}] run scoreboard players set @s content_lock.check_for_death 0

execute if score L content_lock.timer1 matches 12 as @a run function content_lock:player/passives/round_health

execute if entity @r[tag=content_lock.iron_grip] as @a[tag=content_lock.iron_grip] run function content_lock:player/enchantments/iron_grip_disable
execute if entity @r[tag=content_lock.last_breath] as @a[tag=content_lock.last_breath] run function content_lock:player/enchantments/last_breath_disable

execute as @a run item modify entity @s player.cursor content_lock:remove_repair_cost

execute if entity @r[scores={content_lock.cake_eaten=1..}] as @a[scores={content_lock.cake_eaten=1..}] run function content_lock:player/passives/eaten
execute if entity @r[scores={content_lock.combo_timer=1..}] as @a[scores={content_lock.combo_timer=1..}] run function content_lock:player/enchantments/combo_decrease

execute if entity @r[scores={content_lock.item_use_cooldown=1..}] as @a[scores={content_lock.item_use_cooldown=1..}] run scoreboard players remove @s content_lock.item_use_cooldown 1

execute if score L content_lock.timer1 matches 7 run function content_lock:player/ticks/tick7

execute if entity @r[scores={content_lock.enchantment.bloodthirst=1..}] as @a[scores={content_lock.enchantment.bloodthirst=1..}] run function content_lock:player/enchantments/bloodthirst/remove_bonus
#execute if entity @r[scores={content_lock.enchantment.combat_knowledge=1..}] as @a[scores={content_lock.enchantment.combat_knowledge=1..}] run function content_lock:player/enchantments/combat_knowledge/remove_bonus

execute if entity @r[tag=content_lock.enchantment.faura,tag=!content_lock.enchantment.faura] as @a[tag=content_lock.enchantment.faura.stats,tag=!content_lock.enchantment.faura] run function content_lock:player/enchantments/faura/remove_stats
execute if entity @r[tag=content_lock.enchantment.immovable.stats,tag=!content_lock.enchantment.immovable] as @a[tag=content_lock.enchantment.immovable.stats,tag=!content_lock.enchantment.immovable] run function content_lock:player/enchantments/immovable/remove_stats

execute if entity @r[tag=content_lock.enchantment.active] as @a[tag=content_lock.enchantment.active] run function content_lock:player/enchantments/tick

execute if entity @r[scores={content_lock.enchantment.lightstruck.distance=100..}] as @a[scores={content_lock.enchantment.lightstruck.distance=100..}] run scoreboard players set @s content_lock.enchantment.lightstruck.distance 0
execute if entity @r[scores={content_lock.sneak_time_counter=1..}] as @a[scores={content_lock.sneak_time_counter=1..}] run scoreboard players set @s content_lock.sneak_time_counter 0
execute if entity @r[scores={content_lock.enchantment.bloodthirst.fight_time=1..}] as @a[scores={content_lock.enchantment.bloodthirst.fight_time=1..}] run scoreboard players remove @s content_lock.enchantment.bloodthirst.fight_time 1
execute if entity @r[scores={content_lock.enchantment.combat_knowledge.fight_time=1..}] as @a[scores={content_lock.enchantment.combat_knowledge.fight_time=1..}] run scoreboard players remove @s content_lock.enchantment.combat_knowledge.fight_time 1
execute if entity @r[scores={content_lock.anchor_movement=1..}] as @a[scores={content_lock.anchor_movement=1..}] run scoreboard players remove @s content_lock.anchor_movement 1
execute if entity @r[scores={content_lock.anchor_sneak=1}] as @a[scores={content_lock.anchor_sneak=1}] run tag @s remove content_lock.tatsugeki.anchor_sneak_counted
execute if entity @r[scores={content_lock.anchor_sneak=1..}] as @a[scores={content_lock.anchor_sneak=1..}] run scoreboard players remove @s content_lock.anchor_sneak 1
execute if entity @r[scores={content_lock.bow_charge=1..}] as @a[scores={content_lock.bow_charge=1..}] unless items entity @s weapon.mainhand bow run scoreboard players set @s content_lock.bow_charge 0
execute if entity @r[scores={content_lock.quickstep_dagger_charge=1..}] as @a[scores={content_lock.quickstep_dagger_charge=1..}] run scoreboard players remove @s content_lock.quickstep_dagger_charge 1