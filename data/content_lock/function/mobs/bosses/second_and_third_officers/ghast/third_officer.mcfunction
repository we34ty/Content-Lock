tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target
execute unless entity @n[tag=content_lock.im_a_target] as @n[tag=content_lock.third_officer.mount] on target run tag @s add content_lock.im_a_target

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @n[tag=content_lock.im_a_target] run function content_lock:mobs/bosses/second_and_third_officers/ghast/choose_attack
execute if entity @s[nbt={HurtTime:1s}] run scoreboard players set @s content_lock.timer2 200
execute if entity @s[nbt={HurtTime:1s}] run scoreboard players set @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1},tag=!content_lock.exhausted] if entity @n[type=fireball,distance=..40] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @n[type=fireball,distance=..40] as @e[type=fireball,distance=..40] run kill @s

execute if entity @s[tag=content_lock.third_officer.fireball] run function content_lock:mobs/bosses/second_and_third_officers/ghast/fireball
execute if entity @s[tag=content_lock.third_officer.blue_fireball] run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_fireball
execute if entity @s[tag=content_lock.third_officer.blue_laser] run function content_lock:mobs/bosses/second_and_third_officers/ghast/blue_laser
execute if entity @s[tag=content_lock.third_officer.explode_front] run function content_lock:mobs/bosses/second_and_third_officers/ghast/explode_front
execute if entity @s[tag=content_lock.third_officer.stun_knockback] run function content_lock:mobs/bosses/second_and_third_officers/ghast/stun_knockback
execute if entity @s[tag=content_lock.third_officer.vortex_explode] run function content_lock:mobs/bosses/second_and_third_officers/ghast/vortex_explode


execute unless entity @n[tag=content_lock.second_officer] run function content_lock:mobs/bosses/second_and_third_officers/ghast/survived
function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.both_officers",duration:220}
execute if score L content_lock.timer1 matches 7 at @p at @n[tag=content_lock.boss] as @e[tag=content_lock.boss] run function content_lock:mobs/bosses/boss_player_count_scaling {distance:80}
function content_lock:mobs/bosses/boss_bars/officers_ghast

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=2..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=250..,content_lock.attack_timer=2},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if score L content_lock.timer1 matches 2 if entity @s[scores={content_lock.boss_exhaustion=2..},tag=content_lock.second_phase] run scoreboard players remove @s content_lock.boss_exhaustion 2
execute if score @s content_lock.timer2 matches 0 run scoreboard players set @s content_lock.boss_exhaustion 500
execute if score @s content_lock.timer2 matches 1 run data merge entity @s {Silent:1b}
execute if score @s content_lock.timer2 matches 200 run data merge entity @s {Silent:0b}
execute if score @s content_lock.timer2 matches 1.. if score @n[tag=content_lock.second_officer] content_lock.timer2 matches 1.. run scoreboard players remove @s content_lock.timer2 1

execute if entity @s[tag=content_lock.third_officer.attacking] as @n[tag=content_lock.third_officer.mount] run data merge entity @s {Motion:[0.0,0.0,0.0]}
#execute if score @s content_lock.attack_timer matches 1 as @n[tag=content_lock.third_officer.mount] run data merge entity @s {NoAI:0b}
execute at @n[tag=content_lock.third_officer.mount] rotated as @s run tp @s ~ ~-1 ~
execute rotated as @s run rotate @n[tag=content_lock.third_officer.helmet] ~ 0