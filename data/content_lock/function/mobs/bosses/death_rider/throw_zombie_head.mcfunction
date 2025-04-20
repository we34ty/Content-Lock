execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 100
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 80
execute if entity @s[scores={content_lock.attack_timer=80}] run attribute @s attack_damage modifier add content_lock.no_attack -1 add_multiplied_total
execute if entity @s[scores={content_lock.attack_timer=80}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier add content_lock.no_speed -1 add_multiplied_total

execute if entity @s[scores={content_lock.attack_timer=75..80}] run rotate @s ~30 0
execute if entity @s[scores={content_lock.attack_timer=75}] run playsound entity.zombie.infect hostile @a ~ ~ ~ 2 1
execute if entity @s[scores={content_lock.attack_timer=61..74}] run rotate @s ~ 0
execute if entity @s[scores={content_lock.attack_timer=60..75}] positioned ~ ~2 ~ run particle soul ^ ^ ^1 0.1 0.1 0.1 0.04 6 normal @a
execute if entity @s[scores={content_lock.attack_timer=60..65}] run rotate @s ~30 0
execute if entity @s[scores={content_lock.attack_timer=60}] facing entity @e[tag=content_lock.im_a_target,type=#minecraft:boss_can_damage] eyes run rotate @s ~ 0
execute if entity @s[scores={content_lock.attack_timer=60}] positioned ~ ~2 ~ run summon magma_cube ^ ^ ^1 {Size:0,Tags:["content_lock.death_rider.throw_zombie_head.entity"],DeathLootTable:"",Silent:1b,attributes:[{id:"attack_damage",base:0.5}],active_effects:[{id:invisibility,duration:-1,show_particles:false}],CustomName:'[{"translate":"content_lock:mob.zombie_head"}]',Passengers:[{id:"minecraft:block_display",Tags:["content_lock.death_rider.throw_zombie_head.display","content_lock.death_rider.throw_zombie_head.in_motion"],block_state:{Name:"minecraft:zombie_head",Properties:{}},transformation:[1.0000f,0.0000f,0.0000f,-0.5000f,0.0000f,1.0000f,0.0000f,-0.5000f,0.0000f,0.0000f,1.0000f,-0.5000f,0.0000f,0.0000f,0.0000f,1.0000f]}]}
execute if entity @s[scores={content_lock.attack_timer=60}] positioned ~ ~2 ~ positioned ^ ^ ^1 as @e[tag=content_lock.death_rider.throw_zombie_head.entity,limit=1,sort=nearest] at @s run function content_lock:mobs/bosses/death_rider/throw_zombie_head_motion
execute if entity @s[scores={content_lock.attack_timer=60}] run attribute @s attack_damage modifier remove content_lock.no_attack
execute if entity @s[scores={content_lock.attack_timer=80}] as @e[tag=content_lock.death_rider_horse,limit=1,sort=nearest] run attribute @s movement_speed modifier remove content_lock.no_speed
execute if entity @s[scores={content_lock.attack_timer=60}] run tag @s remove content_lock.death_rider.throw_zombie_head