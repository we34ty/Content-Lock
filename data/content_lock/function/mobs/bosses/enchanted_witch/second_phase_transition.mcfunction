summon lightning_bolt ~ ~8 ~
effect give @s fire_resistance infinite 0 true
data merge entity @s {Fire:9000s}
tag @s add content_lock.second_phase
scoreboard players set @s content_lock.boss_exhaustion 0