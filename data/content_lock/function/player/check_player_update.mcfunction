function content_lock:player/passives/died

#attribute @s oxygen_bonus modifier add basic_stats -10 add_value
scoreboard players set @s content_lock.max_stamina 400
scoreboard players set @s content_lock.stamina_delay 50
scoreboard players set @s content_lock.stamina_delay_timer 0
scoreboard players set @s content_lock.bleed_stacks 0
tag @s remove content_lock.bleed_active
scoreboard players set @s content_lock.corruption_meter 0
scoreboard players set @s content_lock.frostbite_stacks 0
scoreboard players add @s content_lock.player_skill_level 0
scoreboard players add @s content_lock.atkspd_from_level 0
scoreboard players add @s content_lock.atkrng_from_level 0
scoreboard players add @s content_lock.eqld_from_level 0
scoreboard players add @s content_lock.dmg_from_level 0
scoreboard players add @s content_lock.hp_from_level 0
scoreboard players add @s content_lock.mvtspd_from_level 0
#scoreboard players enable @s LevelUp.ContentLock
#scoreboard players enable @s content_lock.LevelUp.atkrng
#scoreboard players enable @s content_lock.LevelUp.atkspd
#scoreboard players enable @s content_lock.LevelUp.dmg
#scoreboard players enable @s content_lock.LevelUp.eqld
#scoreboard players enable @s content_lock.LevelUp.hp
#scoreboard players enable @s content_lock.LevelUp.mvtspd

#xp add @s 1 points

scoreboard players operation @s content_lock.content_lock_version = L content_lock.content_lock_version