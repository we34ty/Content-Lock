function content_lock:player_passives/parry/projectile_parry_rotate
particle flame ~ ~ ~ 0.1 0.1 0.1 0.03 10 force @a
scoreboard players add @s attack_timer 1
execute if entity @s[scores={attack_timer=40}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=40..}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^1
execute if entity @s[scores={attack_timer=40..}] as @e[distance=0..1,type=!#entities] run damage @s 20 explosion
execute if entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] as @e[distance=0..3,type=ghast] run damage @s 20 explosion
execute if entity @s[scores={attack_timer=40..}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^1
execute if entity @s[scores={attack_timer=40..}] as @e[distance=0..1,type=!#entities] run damage @s 20 explosion
execute if entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] as @e[distance=0..3,type=ghast] run damage @s 20 explosion
execute if entity @s[scores={attack_timer=140..}] at @s run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,ignited:1b,Invulnerable:1b,NoAI:1b,Silent:1b}
execute if entity @s[scores={attack_timer=140..}] run kill @s