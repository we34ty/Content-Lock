tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

#execute if entity @s[scores={content_lock.attack_timer=0}] if entity @n[tag=content_lock.im_a_target] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/choose_attack
execute if entity @s[nbt={HurtTime:1s}] run scoreboard players set @s content_lock.timer2 200

execute unless entity @n[tag=content_lock.third_officer] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/survived
function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.both_officers",duration:220}
execute if score L content_lock.timer1 matches 7 at @p at @n[tag=content_lock.boss] as @e[tag=content_lock.boss] run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/boss_bars/officers_skeleton

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=250..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if score L content_lock.timer1 matches 2 if entity @s[scores={content_lock.boss_exhaustion=2..},tag=content_lock.second_phase] run scoreboard players remove @s content_lock.boss_exhaustion 2
execute if score @s content_lock.timer2 matches 2.. run scoreboard players set @s content_lock.boss_exhaustion 500
execute if score @s content_lock.timer2 matches 1 run scoreboard players set @s content_lock.boss_exhaustion 0
execute if score @s content_lock.timer2 matches 1.. run scoreboard players remove @s content_lock.timer2 1