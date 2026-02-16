tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target
attribute @s attack_damage modifier add content_lock.remove_damage -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @n[tag=content_lock.im_a_target] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/choose_attack
execute if entity @s[nbt={HurtTime:1s}] run scoreboard players set @s content_lock.timer2 200
execute if entity @s[nbt={HurtTime:1s}] run scoreboard players set @s content_lock.boss_exhaustion 0

execute unless entity @n[tag=content_lock.third_officer] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/survived
function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.both_officers",duration:220}
execute if score L content_lock.timer1 matches 7 at @p at @n[tag=content_lock.boss] as @e[tag=content_lock.boss] run function content_lock:mobs/bosses/boss_player_count_scaling {distance:80}
function content_lock:mobs/bosses/boss_bars/officers_skeleton

execute if entity @s[tag=content_lock.second_officer.jump] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/jump
execute if entity @s[tag=content_lock.second_officer.teleport_dark_hand] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/teleport_dark_hand
execute if entity @s[tag=content_lock.second_officer.stab_far] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/stab_far
execute if entity @s[tag=content_lock.second_officer.left_right] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/left_right
execute if entity @s[tag=content_lock.second_officer.spin_slash] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/spin_slash
execute if entity @s[tag=content_lock.second_officer.up_down_long] run function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/up_down_long

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=250..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if score L content_lock.timer1 matches 2 if entity @s[scores={content_lock.boss_exhaustion=2..},tag=content_lock.second_phase] run scoreboard players remove @s content_lock.boss_exhaustion 2
execute unless score @s content_lock.timer2 matches 1.. run scoreboard players set @s content_lock.boss_exhaustion 500
execute if score @s content_lock.timer2 matches 1 run attribute @s movement_speed modifier add content_lock.slow_down.no_attention -0.5 add_multiplied_total
execute if score @s content_lock.timer2 matches 200 run attribute @s movement_speed modifier remove content_lock.slow_down.no_attention
execute if score @s content_lock.timer2 matches 1.. if score @n[tag=content_lock.third_officer] content_lock.timer2 matches 1.. run scoreboard players remove @s content_lock.timer2 1

function content_lock:mobs/bosses/second_and_third_officers/wither_skeleton/dsiplay
#give @s trial_spawner[container_loot={loot_table:"content_lock:chests/dungeon/reward"}]
#setblock ~ ~1 ~ trial_spawner{normal_config:"content_lock:dungeon/zombie_normal",ominous_config:"content_lock:dungeon/zombie_ominous"} replace
#setblock ~ ~ ~ vault{config:{loot_table:"content_lock:chests/dungeon/reward",key_item:{id:"trial_key",components:{custom_data:{"content_lock.dungeon_key":true}}},override_loot_table_to_display:"content_lock:chests/dungeon/reward"}} replace