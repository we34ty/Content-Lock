$data merge entity @s {acceleration_power:$(acceleration)}
$execute rotated as @n[type=wither] positioned ^ ^ ^$(speed) run summon area_effect_cloud ~ ~ ~ {Tags:["content_lock.content_lock.wither.projectile_barrage_wall.projectile.saved_motion"],custom_particle:{type:"block",block_state:"air"},Duration:0}
$execute store result score @s content_lock.huhhealth1 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.content_lock.wither.projectile_barrage_wall.projectile.saved_motion,limit=1,sort=nearest] Pos[0] 10000
execute store result score @s content_lock.huhhealth2 run data get entity @s Pos[0] 10000
scoreboard players operation @s content_lock.huhhealth1 -= @s content_lock.huhhealth2
execute as @e[tag=content_lock.wither.projectile_barrage_wall.projectile] store result entity @s Motion[0] double 0.000001 run scoreboard players get @n[type=wither] content_lock.huhhealth1

$execute store result score @s content_lock.huhhealth1 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.content_lock.wither.projectile_barrage_wall.projectile.saved_motion,limit=1,sort=nearest] Pos[1] 10000
execute store result score @s content_lock.huhhealth2 run data get entity @s Pos[1] 10000
scoreboard players operation @s content_lock.huhhealth1 -= @s content_lock.huhhealth2
execute as @e[tag=content_lock.wither.projectile_barrage_wall.projectile] store result entity @s Motion[1] double 0.000001 run scoreboard players get @n[type=wither] content_lock.huhhealth1

$execute store result score @s content_lock.huhhealth1 positioned ^ ^ ^$(speed) run data get entity @e[tag=content_lock.content_lock.wither.projectile_barrage_wall.projectile.saved_motion,limit=1,sort=nearest] Pos[2] 10000
execute store result score @s content_lock.huhhealth2 run data get entity @s Pos[2] 10000
scoreboard players operation @s content_lock.huhhealth1 -= @s content_lock.huhhealth2
execute as @e[tag=content_lock.wither.projectile_barrage_wall.projectile] store result entity @s Motion[2] double 0.000001 run scoreboard players get @n[type=wither] content_lock.huhhealth1

$execute positioned ^ ^ ^$(speed) run kill @e[tag=content_lock.content_lock.wither.projectile_barrage_wall.projectile.saved_motion,limit=1,sort=nearest]