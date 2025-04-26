tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute as @e[type=zombified_piglin,distance=..40,tag=!content_lock.boss] run function content_lock:mobs/bosses/boss_despawn

execute if entity @s[scores={content_lock.attack_timer=0}] run function content_lock:mobs/bosses/zombified_piglin_princess/choose_attack

execute if entity @s[tag=content_lock.zombified_piglin_princess.fireball] run function content_lock:mobs/bosses/zombified_piglin_princess/fireball

execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/music/boss_music {song:music.content_lock.corrupted_princess,duration:3940}
function content_lock:mobs/bosses/boss_bars/zombified_piglin_princess

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=300..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1
