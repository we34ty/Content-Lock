tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

#apparently it takes wither 220 ticks to spawn so give him 221 before you do anything
scoreboard players add @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 221.. run data merge entity @s {NoAI:1b}
execute if entity @s[nbt={HurtTime:1s}] run data merge entity @s {NoAI:0b}
execute if score @s content_lock.timer1 matches 221.. run function content_lock:mobs/bosses/wither/ai/tick

execute if score @s content_lock.timer1 matches 221.. if entity @s[scores={content_lock.attack_timer=0}] run function content_lock:mobs/bosses/wither/choose_attack



execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/music/boss_music {song:music.content_lock.wither1,duration:6820}

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if score @s content_lock.timer1 matches 221.. if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=300..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1

