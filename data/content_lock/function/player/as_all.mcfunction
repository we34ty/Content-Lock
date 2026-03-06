##checks if there have been any new versions for each player
execute unless score @s content_lock.content_lock_version = L content_lock.content_lock_version run function content_lock:player/check_player_update
##calculates the total damage dealt by players
function content_lock:player/check_damage_dealt_total

##manages player hunger
function content_lock:player/passives/hunger
##manages the player health regen given by things such as food and enchantments for values impossible to achieve with simple instant_health
function content_lock:player/passives/health_regen
##manages the player effects, so they can be displayed above the hotbar
function content_lock:player/effects/collect_effects
##checks the items in player's mainhand/inventory (mostly unused)
function content_lock:player/items/tick
##manages all of the fishing aspects from the reworked fishing system
function content_lock:player/passives/fishing/tick

##check if player has clicked any of the level-up buttons
function content_lock:player/levels/check_triggers
##unused
execute if entity @s[scores={content_lock.spoken_with_villager=1..}] run function content_lock:player/passives/check_for_villager_spoken

##used for the cavalry enchantment to check if player is on a mount or not
execute if entity @s[scores={content_lock.cavalry_counter=1}] run function content_lock:player/enchantments/cavalry_disable
execute if entity @s[scores={content_lock.cavalry_counter=1..}] run scoreboard players remove @s content_lock.cavalry_counter 1

##manage boss music
execute if entity @s[tag=content_lock.listening_to_music] at @s run function content_lock:mobs/bosses/music/boss_music_stop

##check if player has died
execute if entity @s[scores={content_lock.time_since_death=1}] run function content_lock:player/passives/died
execute if entity @s[scores={content_lock.check_for_death=1..}] run scoreboard players set @s content_lock.check_for_death 0

##enchantment-based functions made to remove their bonuses
execute if entity @s[tag=content_lock.iron_grip] run function content_lock:player/enchantments/iron_grip_disable
execute if entity @s[tag=content_lock.last_breath] run function content_lock:player/enchantments/last_breath_disable

##removes the repair cost from anything in player's cursor 'slot', so it can be repaired infinitely
item modify entity @s player.cursor content_lock:remove_repair_cost

##check for eating cake, to count as eating something
execute if entity @s[scores={content_lock.cake_eaten=1..}] run function content_lock:player/passives/eaten

##'combo' enchantment manager
execute if entity @s[scores={content_lock.combo_timer=1..}] run function content_lock:player/enchantments/combo_decrease

execute if entity @s[scores={content_lock.item_use_cooldown=1..}] run scoreboard players remove @s content_lock.item_use_cooldown 1

##function for managing the regeneration effect given by the wither spell
execute if entity @s[scores={content_lock.wither_regen=1..}] at @s run function content_lock:player/passives/wither_regen

##even more enchantments
execute if entity @s[scores={content_lock.enchantment.bloodthirst=1..}] run function content_lock:player/enchantments/bloodthirst/remove_bonus
#execute if entity @s[scores={content_lock.enchantment.combat_knowledge=1..}] run function content_lock:player/enchantments/combat_knowledge/remove_bonus

execute if entity @s[tag=content_lock.enchantment.faura,tag=!content_lock.enchantment.faura] run function content_lock:player/enchantments/faura/remove_stats
execute if entity @s[tag=content_lock.enchantment.immovable.stats,tag=!content_lock.enchantment.immovable] run function content_lock:player/enchantments/immovable/remove_stats

##more grouped enchantments
execute if entity @s[tag=content_lock.enchantment.active] run function content_lock:player/enchantments/tick

##manages the custom weapon animations and systems
function content_lock:player/weapons/tick

##check if a player has placed a quarry
execute if score @s content_lock.quarry_place matches 1.. at @s run function content_lock:player/passives/placed_special

##remove all items that need to be removed from player's inventory
clear @s *[custom_data~{"content_lock:clear_in_inventory":true}]

##check if player has a duplicated enchantment in their inventory, to pay the price of the duplication
execute if items entity @s player.cursor *[custom_data~{"content_lock:duplication_result":true}] at @s run function content_lock:duplicator/player_duped
execute if items entity @s inventory.* *[custom_data~{"content_lock:duplication_result":true}] at @s run function content_lock:duplicator/player_duped
execute if items entity @s hotbar.* *[custom_data~{"content_lock:duplication_result":true}] at @s run function content_lock:duplicator/player_duped
execute if items entity @s weapon.offhand *[custom_data~{"content_lock:duplication_result":true}] at @s run function content_lock:duplicator/player_duped

##check if player has been teleported by a wormhole and if the chunk they are in is loaded
execute if entity @s[tag=content_lock.load_chunk_no_gravity] at @s if loaded ~ ~ ~ run attribute @s gravity modifier remove content_lock.load_chunk_no_gravity
execute if entity @s[tag=content_lock.load_chunk_no_gravity] at @s if loaded ~ ~ ~ run tag @s remove content_lock.load_chunk_no_gravity

##some scoreboard calculations at the end of each tick
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