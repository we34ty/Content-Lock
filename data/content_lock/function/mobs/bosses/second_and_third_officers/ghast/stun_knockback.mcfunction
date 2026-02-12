# Initialize attack timer and exhaustion
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 140
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 100

# Set attacking state
execute if entity @s[scores={content_lock.attack_timer=100}] run tag @s add content_lock.third_officer.attacking

# Warning phase - face target and show red particles
execute if entity @s[scores={content_lock.attack_timer=90..100}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=100}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 0.8
execute if entity @s[scores={content_lock.attack_timer=95}] run playsound block.beacon.power_select hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=100}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^5 run summon marker ~ ~ ~ {Tags:["content_lock.third_officer.stun_knockback.point"]}

# Show attack zone with white/yellow lightning particles (visually distinct from red vortex)
execute if entity @s[scores={content_lock.attack_timer=80..100}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16777215,scale:3} ~ ~ ~ 4 2 4 0.05 80 force @a
execute if entity @s[scores={content_lock.attack_timer=80..100}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16776960,scale:2} ~ ~1 ~ 3.5 1.5 3.5 0.05 50 force @a
execute if entity @s[scores={content_lock.attack_timer=90..100}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle electric_spark ~ ~1 ~ 3 1.5 3 0.2 15 force @a
execute if entity @s[scores={content_lock.attack_timer=85..100}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle end_rod ~ ~1 ~ 3.5 1.5 3.5 0.05 10 force @a
execute if entity @s[scores={content_lock.attack_timer=82..84}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle gust ~ ~0.5 ~ 3 0.5 3 0.01 10 force @a

# Build up sounds - thunder theme
execute if entity @s[scores={content_lock.attack_timer=90}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 0.8
execute if entity @s[scores={content_lock.attack_timer=85}] run playsound block.beacon.ambient hostile @a ~ ~ ~ 4 2
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.warden.sonic_boom hostile @a ~ ~ ~ 4 2
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.breeze.charge hostile @a ~ ~ ~ 4 0.8

# Execute the attack - lightning shockwave
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.5
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=80}] run playsound item.trident.thunder hostile @a ~ ~ ~ 4 1.2
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 2 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle gust_emitter_large ~ ~0.5 ~ 0 0 0 0 1 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle sweep_attack ~ ~1 ~ 4 1 4 0.1 40 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16777215,scale:4} ~ ~1 ~ 4 2 4 0.05 200 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16776960,scale:4} ~ ~1 ~ 3.5 1.5 3.5 0.05 150 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle electric_spark ~ ~1 ~ 4 2 4 0.4 100 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle sonic_boom ~ ~1 ~ 0 0 0 0 1 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle flash{color:16777215} ~ ~1 ~ 0 0 0 0 3 force @a

# Knockback and stun effects - no damage, strong motion-based knockback
execute if entity @s[scores={content_lock.attack_timer=80}] run scoreboard players set $strength player_motion.api.launch 20000
execute if entity @s[scores={content_lock.attack_timer=80}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,dx=16,dy=16,dz=16] at @s facing entity @n[tag=content_lock.third_officer.stun_knockback.point] feet rotated ~180 -20 run function player_motion:api/launch_looking
# Apply stronger upward motion to non-player entities
execute if entity @s[scores={content_lock.attack_timer=80}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,type=!player,dx=16,dy=16,dz=16] run data modify entity @s Motion[1] set value 0.6
execute if entity @s[scores={content_lock.attack_timer=80}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,type=player,dx=16,dy=16,dz=16] run effect give @s slowness 3 4 true
execute if entity @s[scores={content_lock.attack_timer=80}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,type=player,dx=16,dy=16,dz=16] run effect give @s mining_fatigue 3 2 true
# Secondary shockwave rings - white/yellow expanding waves
execute if entity @s[scores={content_lock.attack_timer=78}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16777215,scale:2.5} ~ ~0.1 ~ 6 0.5 6 0.05 120 force @a
execute if entity @s[scores={content_lock.attack_timer=80}] at @n[tag=content_lock.third_officer.stun_knockback.point] run playsound block.amethyst_block.resonate hostile @a ~ ~ ~ 4 0.8
execute if entity @s[scores={content_lock.attack_timer=76}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16776960,scale:2} ~ ~0.1 ~ 8 0.5 8 0.05 100 force @a
execute if entity @s[scores={content_lock.attack_timer=74}] at @n[tag=content_lock.third_officer.stun_knockback.point] run particle dust{color:16777215,scale:1.5} ~ ~0.1 ~ 10 0.5 10 0.05 80 force @a

# Cleanup
execute if entity @s[scores={content_lock.attack_timer=70}] run kill @e[tag=content_lock.third_officer.stun_knockback.point]
execute if entity @s[scores={content_lock.attack_timer=70}] run tag @s remove content_lock.third_officer.attacking
execute if entity @s[scores={content_lock.attack_timer=70}] run tag @s remove content_lock.third_officer.stun_knockback
