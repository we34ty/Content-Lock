tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @n[tag=content_lock.im_a_target] run function content_lock:mobs/bosses/second_and_third_officers/ghast/choose_attack


execute unless entity @e[tag=second_officer,distance=0..40] run function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.one_officer",duration:276}
execute if entity @s[tag=!separated_leaders] unless entity @e[tag=second_officer,distance=0..40] run tag @a[distance=0..40] remove listening_to_music
execute unless entity @e[tag=second_officer,distance=0..40] run tag @s add separated_leaders
execute if entity @s[tag=separated_leaders] if entity @e[tag=second_officer,distance=0..40] run tag @a[distance=0..40] remove listening_to_music
execute if entity @s[tag=separated_leaders] if entity @e[tag=second_officer,distance=0..40] run tag @s remove separated_leaders
execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/boss_bars/officers_skeleton

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=400..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if score L content_lock.timer1 matches 2 if entity @s[scores={content_lock.boss_exhaustion=2..},tag=content_lock.second_phase] run scoreboard players remove @s content_lock.boss_exhaustion 2
