# Initialize attack timer and exhaustion
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 180
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 120

# Set attacking state
execute if entity @s[scores={content_lock.attack_timer=120}] run tag @s add content_lock.third_officer.attacking

# Warning phase - face target and show red particles
execute if entity @s[scores={content_lock.attack_timer=100..120}] facing entity @n[tag=content_lock.im_a_target] feet run rotate @s ~ ~
execute if entity @s[scores={content_lock.attack_timer=120}] run playsound entity.ghast.warn hostile @a ~ ~ ~ 4 0.9
execute if entity @s[scores={content_lock.attack_timer=110}] run playsound block.portal.trigger hostile @a ~ ~ ~ 4 1.2
execute if entity @s[scores={content_lock.attack_timer=120}] facing entity @n[tag=content_lock.im_a_target] feet positioned ~ ~1.5 ~ positioned ^ ^ ^6 run summon marker ~ ~ ~ {Tags:["content_lock.third_officer.vortex_explode.point"]}

# Show vortex zone with red particles
execute if entity @s[scores={content_lock.attack_timer=85..120}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:16711680,scale:3} ~ ~1 ~ 3.5 2 3.5 0.05 70 force @a
execute if entity @s[scores={content_lock.attack_timer=100..120}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:8388736,scale:2} ~ ~1 ~ 3 2 3 0.05 40 force @a
execute if entity @s[scores={content_lock.attack_timer=95..120}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle portal ~ ~1 ~ 2.5 1.5 2.5 1 30 force @a

# Rotate the vortex marker for visual effect
execute if entity @s[scores={content_lock.attack_timer=85..120}] as @n[tag=content_lock.third_officer.vortex_explode.point] at @s run rotate @s ~15 0

# Warning sounds
execute if entity @s[scores={content_lock.attack_timer=110}] run playsound entity.ghast.shoot hostile @a ~ ~ ~ 4 0.7
execute if entity @s[scores={content_lock.attack_timer=95}] run playsound block.portal.trigger hostile @a ~ ~ ~ 4 1.5
execute if entity @s[scores={content_lock.attack_timer=85}] run playsound block.portal.trigger hostile @a ~ ~ ~ 4 1.8

# Vortex pull phase - pull entities toward the center with increasing strength
execute if entity @s[scores={content_lock.attack_timer=70..110}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle reverse_portal ~ ~1 ~ 4 2 4 0.5 100 force @a
execute if entity @s[scores={content_lock.attack_timer=70..110}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:16711680,scale:2} ~ ~1 ~ 4 2 4 0.05 50 force @a
execute if entity @s[scores={content_lock.attack_timer=70..110}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle enchant ~ ~1 ~ 3 2 3 1 50 force @a
# Early pull - weak, easily escapable (300 = 0.03 velocity/tick)
execute if entity @s[scores={content_lock.attack_timer=100..110}] run scoreboard players set $strength player_motion.api.launch 300
execute if entity @s[scores={content_lock.attack_timer=100..110}] positioned ~-10 ~-10 ~-10 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,dx=20,dy=20,dz=20] at @s facing entity @n[tag=content_lock.third_officer.vortex_explode.point] feet run function player_motion:api/launch_looking
# Medium pull - noticeable resistance (700 = 0.07 velocity/tick)
execute if entity @s[scores={content_lock.attack_timer=88..99}] run scoreboard players set $strength player_motion.api.launch 700
execute if entity @s[scores={content_lock.attack_timer=88..99}] positioned ~-10 ~-10 ~-10 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,dx=20,dy=20,dz=20] at @s facing entity @n[tag=content_lock.third_officer.vortex_explode.point] feet run function player_motion:api/launch_looking
# Strong pull - hard to escape (1100 = 0.11 velocity/tick)
execute if entity @s[scores={content_lock.attack_timer=76..87}] run scoreboard players set $strength player_motion.api.launch 1100
execute if entity @s[scores={content_lock.attack_timer=76..87}] positioned ~-10 ~-10 ~-10 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,dx=20,dy=20,dz=20] at @s facing entity @n[tag=content_lock.third_officer.vortex_explode.point] feet run function player_motion:api/launch_looking
# Very strong pull - almost impossible to escape without elytra (1500 = 0.15 velocity/tick)
execute if entity @s[scores={content_lock.attack_timer=70..75}] run scoreboard players set $strength player_motion.api.launch 1500
execute if entity @s[scores={content_lock.attack_timer=70..75}] positioned ~-10 ~-10 ~-10 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,dx=20,dy=20,dz=20] at @s facing entity @n[tag=content_lock.third_officer.vortex_explode.point] feet run function player_motion:api/launch_looking
# Pull non-player entities - apply gravity towards center and slight upward
execute if entity @s[scores={content_lock.attack_timer=70..110}] at @n[tag=content_lock.third_officer.vortex_explode.point] positioned ~-10 ~-10 ~-10 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,type=!player,dx=20,dy=20,dz=20] run data modify entity @s Motion[1] set value 0.1

# Build up to explosion
execute if entity @s[scores={content_lock.attack_timer=75}] run playsound entity.ghast.scream hostile @a ~ ~ ~ 4 0.5
execute if entity @s[scores={content_lock.attack_timer=71}] run playsound block.respawn_anchor.charge hostile @a ~ ~ ~ 4 2
execute if entity @s[scores={content_lock.attack_timer=70..74}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle soul_fire_flame ~ ~1 ~ 3 2 3 0.1 60 force @a
execute if entity @s[scores={content_lock.attack_timer=70..74}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:16711680,scale:4} ~ ~1 ~ 3 2 3 0.05 100 force @a
execute if entity @s[scores={content_lock.attack_timer=70..74}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle electric_spark ~ ~1 ~ 2.5 2 2.5 0.3 30 force @a

# Final explosion
execute if entity @s[scores={content_lock.attack_timer=70}] run playsound entity.generic.explode hostile @a ~ ~ ~ 4 0.8
execute if entity @s[scores={content_lock.attack_timer=70}] run playsound entity.wither.shoot hostile @a ~ ~ ~ 4 1.2
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 3 force @a
#execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle flash ~ ~1 ~ 1 1 1 0 5 force @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle soul_fire_flame ~ ~1 ~ 0 0 0 0.5 200 force @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:16711680,scale:4} ~ ~1 ~ 5 3 5 0.05 200 force @a
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle lava ~ ~1 ~ 4 2 4 0.5 50 force @a

# Explosion damage - high damage at center, falling off with distance
execute if entity @s[scores={content_lock.attack_timer=70}] at @n[tag=content_lock.third_officer.vortex_explode.point] run function content_lock:mobs/bosses/universal/damage_player_d {damage:15,half_distance:4,distance:8,damage_type:fireball}

# Knockback effect using motion - push entities away from vortex
execute if entity @s[scores={content_lock.attack_timer=70}] run scoreboard players set $strength player_motion.api.launch 25000
execute if entity @s[scores={content_lock.attack_timer=70}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,dx=16,dy=16,dz=16] at @s facing entity @n[tag=content_lock.third_officer.vortex_explode.point] feet rotated ~180 -10 run function player_motion:api/launch_looking
# Push non-player entities upward and outward
execute if entity @s[scores={content_lock.attack_timer=70}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,type=!player,dx=16,dy=16,dz=16] run data modify entity @s Motion[1] set value 0.8
execute if entity @s[scores={content_lock.attack_timer=70}] positioned ~-8 ~-8 ~-8 as @e[type=#content_lock:boss_can_damage,tag=!content_lock.boss,type=player,dx=16,dy=16,dz=16] run effect give @s weakness 4 1 true

# Lingering effects
execute if entity @s[scores={content_lock.attack_timer=68}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:16711680,scale:3} ~ ~0.1 ~ 6 0.5 6 0.05 100 force @a
execute if entity @s[scores={content_lock.attack_timer=66}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle dust{color:8388736,scale:2} ~ ~0.1 ~ 8 0.5 8 0.05 80 force @a
execute if entity @s[scores={content_lock.attack_timer=60..69}] at @n[tag=content_lock.third_officer.vortex_explode.point] run particle smoke ~ ~0.5 ~ 3 1 3 0.05 10 force @a

# Cleanup
execute if entity @s[scores={content_lock.attack_timer=60}] run kill @e[tag=content_lock.third_officer.vortex_explode.point]
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.third_officer.attacking
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.third_officer.vortex_explode
