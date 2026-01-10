execute unless score @s content_lock.content_lock_version = L content_lock.content_lock_version run function content_lock:player/check_player_update
function content_lock:player/check_damage_dealt_total

function content_lock:player/passives/hunger
function content_lock:player/passives/health_regen
function content_lock:player/effects/collect_effects
function content_lock:player/items/tick
function content_lock:player/passives/fishing/tick

function content_lock:player/levels/check_triggers
execute if entity @s[scores={content_lock.spoken_with_villager=1..}] run function content_lock:player/passives/check_for_villager_spoken

execute if entity @s[scores={content_lock.cavalry_counter=1}] run function content_lock:player/enchantments/cavalry_disable
execute if entity @s[scores={content_lock.cavalry_counter=1..}] run scoreboard players remove @s content_lock.cavalry_counter 1

execute if entity @s[tag=content_lock.listening_to_music] at @s run function content_lock:mobs/bosses/music/boss_music_stop

execute if entity @s[scores={content_lock.time_since_death=1}] run function content_lock:player/passives/died
execute if entity @s[scores={content_lock.check_for_death=1..}] run scoreboard players set @s content_lock.check_for_death 0

execute if entity @s[tag=content_lock.iron_grip] run function content_lock:player/enchantments/iron_grip_disable
execute if entity @s[tag=content_lock.last_breath] run function content_lock:player/enchantments/last_breath_disable

item modify entity @s player.cursor content_lock:remove_repair_cost

execute if entity @s[scores={content_lock.cake_eaten=1..}] run function content_lock:player/passives/eaten
execute if entity @s[scores={content_lock.combo_timer=1..}] run function content_lock:player/enchantments/combo_decrease

execute if entity @s[scores={content_lock.item_use_cooldown=1..}] run scoreboard players remove @s content_lock.item_use_cooldown 1

execute if entity @s[scores={content_lock.wither_regen=1..}] at @s run function content_lock:player/passives/wither_regen

execute if entity @s[scores={content_lock.enchantment.bloodthirst=1..}] run function content_lock:player/enchantments/bloodthirst/remove_bonus
#execute if entity @s[scores={content_lock.enchantment.combat_knowledge=1..}] run function content_lock:player/enchantments/combat_knowledge/remove_bonus

execute if entity @s[tag=content_lock.enchantment.faura,tag=!content_lock.enchantment.faura] run function content_lock:player/enchantments/faura/remove_stats
execute if entity @s[tag=content_lock.enchantment.immovable.stats,tag=!content_lock.enchantment.immovable] run function content_lock:player/enchantments/immovable/remove_stats

execute if entity @s[tag=content_lock.enchantment.active] run function content_lock:player/enchantments/tick

execute if entity @s[scores={content_lock.enchantment.lightstruck.distance=100..}] run scoreboard players set @s content_lock.enchantment.lightstruck.distance 0
execute if entity @s[scores={content_lock.sneak_time_counter=1..}] run scoreboard players set @s content_lock.sneak_time_counter 0
execute if entity @s[scores={content_lock.enchantment.bloodthirst.fight_time=1..}] run scoreboard players remove @s content_lock.enchantment.bloodthirst.fight_time 1
execute if entity @s[scores={content_lock.enchantment.combat_knowledge.fight_time=1..}] run scoreboard players remove @s content_lock.enchantment.combat_knowledge.fight_time 1
execute if entity @s[scores={content_lock.fight_time=1..}] run scoreboard players remove @s content_lock.fight_time 1
execute if entity @s[scores={content_lock.anchor_movement=1..}] run scoreboard players remove @s content_lock.anchor_movement 1
execute if entity @s[scores={content_lock.anchor_sneak=1}] run tag @s remove content_lock.tatsugeki.anchor_sneak_counted
execute if entity @s[scores={content_lock.anchor_sneak=1..}] run scoreboard players remove @s content_lock.anchor_sneak 1
execute if entity @s[scores={content_lock.bow_charge=1..}] unless items entity @s weapon.mainhand bow run scoreboard players set @s content_lock.bow_charge 0
execute if entity @s[scores={content_lock.quickstep_dagger_charge=1..}] run scoreboard players remove @s content_lock.quickstep_dagger_charge 1