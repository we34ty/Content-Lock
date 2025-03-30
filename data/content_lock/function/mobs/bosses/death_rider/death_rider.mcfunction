execute as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] store result score @s content_lock.temporary_health_holder run data get entity @s Health
execute as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run scoreboard players set @s content_lock.huhhealth1 1000
execute as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run scoreboard players operation @s content_lock.huhhealth1 -= @s content_lock.temporary_health_holder
execute store result score @s content_lock.temporary_health_holder run data get entity @s Health
scoreboard players operation @s content_lock.temporary_health_holder -= @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] content_lock.huhhealth1
execute if score @s content_lock.temporary_health_holder matches ..0 run tag @s add content_lock.death_inocming
execute if entity @s[tag=content_lock.death_inocming] run scoreboard players set @s content_lock.temporary_health_holder 1
#execute if entity @s[tag=death_inocming] run damage @s 2048 player_attack
execute store result entity @s[tag=!content_lock.death_inocming] Health float 1 run scoreboard players get @s content_lock.temporary_health_holder
data merge entity @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] {Health:1000}
attribute @s spawn_reinforcements base set 20


execute if entity @r[distance=0..40,nbt={HurtTime:1s}] as @a[distance=0..40,nbt={HurtTime:1s}] run scoreboard players add @s content_lock.bleed_stacks 100
#execute if entity @r[distance=0..40,nbt={HurtTime:1s}] run effect give @s instant_damage 1 1 true

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @p[distance=0..6] if predicate content_lock:true_random run tag @s add content_lock.stab_ground_repeat
execute if entity @s[tag=content_lock.stab_ground_repeat] run function content_lock:mobs/bosses/death_rider/stab_ground_repeat

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @p[distance=6.1..] if predicate content_lock:true_random run tag @s add content_lock.charge_at_player
execute if entity @s[tag=content_lock.charge_at_player] run function content_lock:mobs/bosses/death_rider/charge_at_player

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @p[distance=6.1..] if predicate content_lock:true_random run tag @s add content_lock.teleport_and_spin
execute if entity @s[tag=content_lock.teleport_and_spin] run function content_lock:mobs/bosses/death_rider/teleport_and_spin

execute if entity @s[scores={content_lock.attack_timer=0}] if entity @p[distance=0..6] if predicate content_lock:true_random run tag @s add content_lock.bite_from_below
execute if entity @s[tag=content_lock.bite_from_below] run function content_lock:mobs/bosses/death_rider/bite_from_below

#execute if entity @e[tag=iron_guardian_tracking_projectile_indicator] as @e[tag=iron_guardian_tracking_projectile_indicator] at @s run function content_lock:mobs/bosses/iron_guardian/iron_guardian_tracking_projectile_indicator


execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/music/boss_music {song:custom.death_rider,duration:3140}
function content_lock:mobs/bosses/boss_bars/death_rider

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=300..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1



