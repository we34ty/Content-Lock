tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute unless entity @s[tag=content_lock.zombified_piglin_princess.phase2] run function content_lock:mobs/bosses/zombified_piglin_princess/phase1

execute unless entity @s[tag=content_lock.zombified_piglin_princess.phase2] as @e[type=zombified_piglin,distance=..40,tag=!content_lock.boss,tag=!content_lock.zombified_piglin_princess.minion] run function content_lock:mobs/bosses/boss_despawn
execute if entity @s[tag=content_lock.zombified_piglin_princess.phase2] as @e[type=zombified_piglin,distance=..40,tag=!content_lock.boss] run function content_lock:mobs/bosses/boss_despawn

execute if entity @s[scores={content_lock.attack_timer=0},tag=content_lock.zombified_piglin_princess.phase2] run function content_lock:mobs/bosses/zombified_piglin_princess/choose_attack

execute if entity @s[tag=content_lock.zombified_piglin_princess.fireball] run function content_lock:mobs/bosses/zombified_piglin_princess/fireball
execute if entity @s[tag=content_lock.zombified_piglin_princess.rain_fireballs] run function content_lock:mobs/bosses/zombified_piglin_princess/rain_fireballs
execute if entity @s[tag=content_lock.zombified_piglin_princess.phase_in] run function content_lock:mobs/bosses/zombified_piglin_princess/phase_in

execute if entity @s[tag=content_lock.zombified_piglin_princess.laser] run function content_lock:mobs/bosses/zombified_piglin_princess/laser
execute if entity @s[tag=content_lock.zombified_piglin_princess.bandit_bringer] run function content_lock:mobs/bosses/zombified_piglin_princess/bandit_bringer

execute if entity @s[tag=content_lock.zombified_piglin_princess.left_right_combo] run function content_lock:mobs/bosses/zombified_piglin_princess/left_right_combo
execute if entity @s[tag=content_lock.zombified_piglin_princess.volcanic_viper] run function content_lock:mobs/bosses/zombified_piglin_princess/volcanic_viper
execute if entity @s[tag=content_lock.zombified_piglin_princess.gunflame] run function content_lock:mobs/bosses/zombified_piglin_princess/gunflame

execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
execute if entity @s[tag=content_lock.zombified_piglin_princess.phase2] run function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.corrupted_princess",duration:197}
execute unless entity @s[tag=content_lock.zombified_piglin_princess.phase2] run function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.corrupted_princess_enemies",duration:193}
function content_lock:mobs/bosses/boss_bars/zombified_piglin_princess

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=300..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=..0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 2
