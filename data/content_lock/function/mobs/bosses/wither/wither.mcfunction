#execute as @s at @s as @p at @s run scoreboard players add @s y_level_check 1
#execute as @s at @s if score @s y_level_check > @p y_level_check run tp @s ~ ~-0.4 ~
scoreboard players add @s[scores={arrow_damage=221..}] attack_timer 0
scoreboard players add @s arrow_damage 1
execute if entity @s[tag=!begin_wither_fight] run attribute @s minecraft:generic.max_health base set 600
execute if entity @s[tag=!begin_wither_fight] store result entity @s Health double 1 run attribute @s generic.max_health get
execute if entity @s[tag=!begin_wither_fight] run tag @s add boss
execute if entity @s[tag=!begin_wither_fight] run tag @s add begin_wither_fight

data merge entity @s[scores={arrow_damage=221..}] {NoAI:1b}
execute if entity @s[nbt={HurtTime:1s}] run data merge entity @s {NoAI:0b}

execute at @s run fill ~-1 ~1 ~-1 ~1 ~3 ~1 air destroy

execute if entity @r[distance=0..40] if entity @s[scores={arrow_damage=221..}] run function content_lock:bosses/wither/ai/tick


execute if score @s attack_timer matches 0 if entity @p[distance=0..9] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add skull_barrage
execute if entity @s[tag=skull_barrage] run function content_lock:bosses/wither/skull_barrage

execute if score @s attack_timer matches 0 if entity @p[distance=0..9] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add soul_siphon
execute if entity @s[tag=soul_siphon] run function content_lock:bosses/wither/soul_siphon

execute if score @s attack_timer matches 0 if entity @p[distance=0..9] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add necrotic_nova
execute if entity @s[tag=necrotic_nova] run function content_lock:bosses/wither/necrotic_nova

execute if score @s attack_timer matches 0 if entity @p[distance=0..9] if predicate content_lock:true_random if predicate content_lock:three_random run tag @s add cursed_ground
execute if entity @s[tag=cursed_ground] run function content_lock:bosses/wither/cursed_ground

execute if score @s attack_timer matches 0 if entity @p[distance=9.1..40] if predicate content_lock:three_random run tag @s add dark_beam
execute if entity @s[tag=dark_beam] run function content_lock:bosses/wither/dark_beam

execute if score @s attack_timer matches 0 if entity @p[distance=9.1..40] if predicate content_lock:three_random run tag @s add nothing_personal
execute if entity @s[tag=nothing_personal] run function content_lock:bosses/wither/nothing_personal


execute if entity @e[tag=wither_skull_barrage] as @e[tag=wither_skull_barrage] at @s run function content_lock:bosses/wither/wither_skull_barrage
execute if entity @e[tag=wither_dark_beam_center] as @e[tag=wither_dark_beam_center] at @s run function content_lock:bosses/wither/wither_dark_beam_center
execute if entity @e[tag=wither_cursed_ground] as @e[tag=wither_cursed_ground] at @s run function content_lock:bosses/wither/wither_cursed_ground

execute if score L timer1 matches 7 unless entity @r[distance=0..40] store result entity @s Health float 1 run attribute @s generic.max_health get
#execute if score L timer1 matches 7 if entity @r[distance=0..40] store result entity @s Health float 1 run data get entity @s Health 1.001

function content_lock:bosses/boss_music {song:custom.wither1,duration:6820}

execute if score @s attack_timer matches 100.. run scoreboard players set @s attack_timer 0
execute if score @s attack_timer matches 1.. run scoreboard players add @s attack_timer 1

