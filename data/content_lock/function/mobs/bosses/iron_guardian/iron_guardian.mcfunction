#attribute @s generic.attack_damage base set 5
#attribute @s generic.attack_damage modifier add 15d5a6e0-c144-4cb5-ae95-f2fbec2ba2b9 xs5erydtuy -0.5 add_multiplied_total

execute if predicate content_lock:is_night run function content_lock:mobs/bosses/boss_despawn

execute if score L content_lock.timer1 matches 4 run data modify entity @s angry_at set from entity @p UUID
 
#execute as @p at @s store result score @s y_level_check run data get entity @s Pos[1]
#execute store result score @s y_level_check run data get entity @s Pos[1]

#scoreboard players add @s y_level_check 2
#execute if entity @s[scores={attack_timer=0}] if score @s y_level_check < @p y_level_check if entity @p[distance=0..14] run tag @s add under_player
#scoreboard players remove @s y_level_check 4
#execute if entity @s[scores={attack_timer=0}] if score @s y_level_check > @p y_level_check if entity @p[distance=0..14] run tag @s add under_player
#execute if entity @s[tag=under_player] run function content_lock:mobs/bosses/iron_guardian/under_player

tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute if entity @s[scores={content_lock.attack_timer=0}] run function content_lock:mobs/bosses/iron_guardian/choose_attack

execute if entity @s[tag=content_lock.iron_guardian.potemkin_buster] run function content_lock:mobs/bosses/iron_guardian/potemkin_buster
execute if entity @s[tag=content_lock.iron_guardian.iron_pillar_fall] run function content_lock:mobs/bosses/iron_guardian/iron_pillar_fall
execute if entity @s[tag=content_lock.iron_guardian.upwards_throw] run function content_lock:mobs/bosses/iron_guardian/upwards_throw

execute if entity @s[tag=content_lock.iron_guardian.jump_towards_player] run function content_lock:mobs/bosses/iron_guardian/jump_towards_player
execute if entity @s[tag=content_lock.iron_guardian.iron_fist_charge] run function content_lock:mobs/bosses/iron_guardian/iron_fist_charge

#execute if entity @e[tag=iron_guardian_tracking_projectile_indicator] as @e[tag=iron_guardian_tracking_projectile_indicator] at @s run function content_lock:bosses/iron_guardian/iron_guardian_tracking_projectile_indicator


execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.iron_guardian",duration:3360}
function content_lock:mobs/bosses/boss_bars/iron_guardian

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..}] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=400..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1



