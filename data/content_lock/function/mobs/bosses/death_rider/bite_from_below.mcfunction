execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.attack_timer=1}] run data merge entity @s {NoAI:1b}
execute if entity @s[scores={content_lock.attack_timer=1}] at @p run summon area_effect_cloud ~ ~ ~ {Duration:42,Tags:[content_lock.death_rider_biter]}
execute if entity @s[scores={content_lock.attack_timer=1..}] at @e[tag=content_lock.death_rider_biter,distance=0..40] run particle dust{color:[0.031, 0.259, 0.0],scale: 1} ~ ~ ~ 1.5 0.1 1.5 1 15 force @a
execute if score L content_lock.timer1 matches 2 if entity @s[scores={content_lock.attack_timer=1..}] at @e[tag=content_lock.death_rider_biter,distance=0..40] run playsound entity.zombie.ambient hostile @a ~ ~ ~ 1 0.5
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_biter,limit=1,sort=nearest] run playsound entity.zombie.break_wooden_door hostile @a[distance=0..3] ~ ~ ~ 2 0.8
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_biter,limit=1,sort=nearest] as @a[distance=0..3] run damage @s 10 fly_into_wall by @e[tag=content_lock.death_rider,limit=1]
execute if entity @s[scores={content_lock.attack_timer=40}] at @e[tag=content_lock.death_rider_biter,limit=1,sort=nearest] run tp @a[distance=0..3] ~ ~-3 ~
execute if entity @s[scores={content_lock.attack_timer=40}] run data merge entity @s {NoAI:0b}
execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.bite_from_below
