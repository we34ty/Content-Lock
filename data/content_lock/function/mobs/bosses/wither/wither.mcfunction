execute if entity @s[nbt={HurtTime:1s}] run tag @e[tag=content_lock.im_a_target] remove content_lock.im_a_target
tag @e[tag=content_lock.im_a_target,distance=40..] remove content_lock.im_a_target
tag @e[tag=content_lock.im_a_target,type=!#boss_can_damage] remove content_lock.im_a_target
tag @a[tag=content_lock.im_a_target,gamemode=creative] remove content_lock.im_a_target
tag @a[tag=content_lock.im_a_target,gamemode=spectator] remove content_lock.im_a_target

execute unless entity @n[tag=content_lock.im_a_target] as @p[gamemode=!creative,gamemode=!spectator] run tag @s add content_lock.im_a_target
execute unless entity @n[tag=content_lock.im_a_target] as @n[type=#boss_can_damage,type=!player,distance=..40] run tag @s add content_lock.im_a_target

execute if score L content_lock.timer1 matches 7 if entity @r[distance=..40,nbt={active_effects:[{id:"minecraft:wither"}]}] as @a[distance=..40,nbt={active_effects:[{id:"minecraft:wither"}]}] run function content_lock:mobs/bosses/wither/bleed_for_wither
execute if entity @n[type=wither_skull] run kill @e[type=wither_skull]

#apparently it takes wither 220 ticks to spawn so give him 221 before you do anything
scoreboard players add @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 219 run function content_lock:mobs/bosses/wither/wither_disable_destruction
execute if score @s content_lock.timer1 matches 221 if score @s content_lock.xp_level matches 1 run gamerule mob_griefing true
execute if score @s content_lock.timer1 matches 221.. run data merge entity @s {NoAI:1b}
execute if entity @s[nbt={HurtTime:1s}] run data merge entity @s {NoAI:0b}
execute if score @s content_lock.timer1 matches 221.. run function content_lock:mobs/bosses/wither/ai/tick

execute if score @s content_lock.timer1 matches 221.. if entity @s[scores={content_lock.attack_timer=0}] if entity @n[tag=content_lock.im_a_target] run function content_lock:mobs/bosses/wither/choose_attack

execute unless entity @s[tag=content_lock.wither.initialized] run function content_lock:mobs/bosses/wither/initialize

execute if entity @s[tag=content_lock.wither.3_lasers] run function content_lock:mobs/bosses/wither/3_lasers
execute if entity @s[tag=content_lock.wither.big_ball_to_rain] run function content_lock:mobs/bosses/wither/big_ball_to_rain
execute if entity @s[tag=content_lock.wither.big_ball_direct] run function content_lock:mobs/bosses/wither/big_ball_direct
execute if entity @s[tag=content_lock.wither.projectile_barrage_wall] run function content_lock:mobs/bosses/wither/projectile_barrage_wall
execute if entity @s[tag=content_lock.wither.charging_explosion_big_buff] run function content_lock:mobs/bosses/wither/charging_explosion_big_buff
execute if entity @s[tag=content_lock.wither.charge_forward] run function content_lock:mobs/bosses/wither/charge_forward
execute if entity @s[tag=content_lock.wither.flash_step] run function content_lock:mobs/bosses/wither/flash_step
execute if entity @s[tag=content_lock.wither.charging_explosion] run function content_lock:mobs/bosses/wither/charging_explosion
execute if entity @s[tag=content_lock.wither.crush_from_above_all] run function content_lock:mobs/bosses/wither/crush_from_above_all
execute if entity @s[tag=content_lock.wither.triple_pushback_roar] run function content_lock:mobs/bosses/wither/triple_pushback_roar
execute if entity @s[tag=content_lock.wither.area_effect_cloud] run function content_lock:mobs/bosses/wither/area_effect_cloud


execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:80}
function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.wither1",duration:341}

execute if score @s content_lock.wither_regen matches 1.. if entity @s[nbt={HurtTime:0s}] run function content_lock:mobs/bosses/wither/wither_heal

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if score @s content_lock.timer1 matches 221.. if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=300..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1

