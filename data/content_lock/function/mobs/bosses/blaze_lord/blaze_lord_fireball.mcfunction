execute if entity @s[tag=projectile_boosted] run tp @s ^ ^ ^0.6 ~ ~2
function content_lock:player_passives/parry/projectile_parry_rotate
scoreboard players add @s timer1 1
execute if entity @s[scores={timer1=1}] run tp @s ~ ~ ~ ~ -90
particle flame ~ ~ ~ 0.2 0.2 0.2 0.01 10 force @a
summon area_effect_cloud ~ ~ ~ {Tags:[direction_to_look_for_lord_fireball]}
execute unless entity @s[tag=projectile_boosted] as @e[tag=direction_to_look_for_lord_fireball,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p feet
execute unless entity @s[tag=projectile_boosted] anchored eyes rotated as @e[tag=direction_to_look_for_lord_fireball,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
execute unless entity @s[tag=projectile_boosted] if block ~ ~ ~ #walkable run tp @s ^ ^ ^0.2
execute if entity @s[scores={timer1=3..}] as @e[distance=0..1,type=!#entities] run damage @s 40 explosion
execute if entity @s[scores={timer1=3..}] positioned ~ ~-1 ~ as @e[distance=0..1,type=!#entities] run damage @s 30 explosion
execute if entity @s[scores={timer1=99}] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,ignited:1b,Invulnerable:1b,NoAI:1b,Silent:1b}
