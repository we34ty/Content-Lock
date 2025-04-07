function content_lock:player_passives/parry/projectile_parry_rotate
particle soul_fire_flame ~ ~ ~ 0.1 0.1 0.1 0.03 10 force @a
scoreboard players add @s attack_timer 1
execute unless entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] run summon area_effect_cloud ~ ~ ~ {Tags:[direction_to_look_for_blue_fireball]}
execute unless entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] as @e[tag=direction_to_look_for_blue_fireball,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p
execute unless entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] anchored eyes rotated as @e[tag=direction_to_look_for_blue_fireball,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if entity @s[scores={attack_timer=40}] facing entity @p feet run tp @s ~ ~ ~ ~ ~
execute unless entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^0.5
execute if entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] if block ~ ~ ~ #walkable run tp @s ^ ^ ^1
execute if entity @s[scores={attack_timer=40..}] as @e[distance=0..1,type=!#entities] run damage @s 15 explosion
execute if entity @s[tag=projectile_boosted] if entity @s[scores={attack_timer=40..}] as @e[distance=0..3,type=ghast] run damage @s 15 explosion
execute if entity @s[scores={attack_timer=140..}] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,ignited:1b,Invulnerable:1b,NoAI:1b,Silent:1b}
execute if entity @s[scores={attack_timer=140..}] run kill @s