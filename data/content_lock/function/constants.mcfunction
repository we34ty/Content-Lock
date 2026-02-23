#version numbver
scoreboard players set L content_lock.content_lock_version 400

#constants
scoreboard players set L content_lock.UUID_id.max 256

#Default Values of Options In Game
execute unless score L content_lock.options.player.limited_boss_respawn matches 0.. run scoreboard players set L content_lock.options.player.limited_boss_respawn 1
execute unless score L content_lock.options.progression.nether_damage matches 0.. run scoreboard players set L content_lock.options.progression.nether_damage 1
execute unless score L content_lock.options.player.bleed matches 0.. run scoreboard players set L content_lock.options.player.bleed 1
execute unless score L content_lock.options.player.corruption matches 0.. run scoreboard players set L content_lock.options.player.corruption 1
execute unless score L content_lock.options.enemy.customization matches 0.. run scoreboard players set L content_lock.options.enemy.customization 1
execute unless score L content_lock.options.enemy.scaling matches 0.. run scoreboard players set L content_lock.options.enemy.scaling 1
execute unless score L content_lock.options.player.nightmares matches 0.. run scoreboard players set L content_lock.options.player.nightmares 1
execute unless score L content_lock.options.player.stamina matches 0.. run scoreboard players set L content_lock.options.player.stamina 1
execute unless score L content_lock.options.player.leveling matches 0.. run scoreboard players set L content_lock.options.player.leveling 1
execute unless score L content_lock.options.player.sleep_exhaustion matches 0.. run scoreboard players set L content_lock.options.player.sleep_exhaustion 1
execute unless score L content_lock.options.player.clock_display matches 0.. run scoreboard players set L content_lock.options.player.clock_display 1
execute unless score L content_lock.options.player.boss_music matches 0.. run scoreboard players set L content_lock.options.player.boss_music 1
execute unless score L content_lock.options.player.disable_sprint matches 0.. run scoreboard players set L content_lock.options.player.disable_sprint 1
execute unless score L content_lock.options.player.custom_weapon_animations matches 0.. run scoreboard players set L content_lock.options.player.custom_weapon_animations 1
execute unless score L content_lock.options.player.weapon_hitbox_visible matches 0.. run scoreboard players set L content_lock.options.player.weapon_hitbox_visible 0
execute unless score L content_lock.options.player.uncalculated_weapon_hitbox_visible matches 0.. run scoreboard players set L content_lock.options.player.uncalculated_weapon_hitbox_visible 0
execute unless score L content_lock.options.game.tick_speed matches 0.. run gamerule random_tick_speed 6
execute unless score L content_lock.options.game.tick_speed matches 0.. run scoreboard players set L content_lock.options.game.tick_speed 6

#gamerule playersSleepingPercentage 101
gamerule natural_health_regeneration false
execute in minecraft:overworld run gamerule natural_health_regeneration false
execute in minecraft:the_nether run gamerule natural_health_regeneration false
execute in minecraft:the_end run gamerule natural_health_regeneration false
execute in content_lock:the_void run gamerule natural_health_regeneration false
gamerule spawn_phantoms false
execute in content_lock:the_void run gamerule reduced_debug_info true
execute in minecraft:overworld run gamerule reduced_debug_info false
execute in minecraft:the_nether run gamerule reduced_debug_info false
execute in minecraft:the_end run gamerule reduced_debug_info false
gamerule tnt_explosion_drop_decay true
#in case minecraft improvements are not turned on this is a separate function
function content_lock:minecarts
