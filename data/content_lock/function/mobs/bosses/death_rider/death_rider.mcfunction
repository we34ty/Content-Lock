execute unless predicate content_lock:is_night as @e[tag=content_lock.death_rider_horse] run function content_lock:mobs/bosses/boss_despawn
execute unless predicate content_lock:is_night run function content_lock:mobs/bosses/boss_despawn

attribute @s spawn_reinforcements base set 20

tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

#execute if entity @r[distance=0..40,nbt={HurtTime:1s}] as @a[distance=0..40,nbt={HurtTime:1s}] run scoreboard players add @s content_lock.bleed_stacks 100
#execute if entity @r[distance=0..40,nbt={HurtTime:1s}] run effect give @s instant_damage 1 1 true

execute if entity @s[scores={content_lock.attack_timer=0}] run function content_lock:mobs/bosses/death_rider/choose_attack

execute if entity @s[tag=content_lock.death_rider.small_jump] run function content_lock:mobs/bosses/death_rider/small_jump
execute if entity @s[tag=content_lock.death_rider.spin_around] run function content_lock:mobs/bosses/death_rider/spin_around
execute if entity @s[tag=content_lock.death_rider.under_punch] run function content_lock:mobs/bosses/death_rider/under_punch

execute if entity @s[tag=content_lock.death_rider.rush_on_horse] run function content_lock:mobs/bosses/death_rider/rush_on_horse
execute if entity @s[tag=content_lock.death_rider.throw_zombie_head] run function content_lock:mobs/bosses/death_rider/throw_zombie_head

execute if entity @s[tag=content_lock.death_rider.spin_teleport] run function content_lock:mobs/bosses/death_rider/spin_teleport
execute if entity @s[tag=content_lock.death_rider.rush_without_horse] run function content_lock:mobs/bosses/death_rider/rush_without_horse

execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/music/boss_music {song:music.content_lock.death_rider,duration:3140}
function content_lock:mobs/bosses/boss_bars/death_rider

scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=300..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1


ride @s[tag=!content_lock.death_rider.rush_without_horse.dismount] mount @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest]

