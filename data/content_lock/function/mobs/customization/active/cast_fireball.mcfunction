summon area_effect_cloud ~ ~1 ~ {Tags:[content_lock.enemy_fireball],Duration:160,custom_particle:{type:"block",block_state:"air"}}
particle small_flame ~ ~1 ~ 0.2 0.2 0.2 0.2 40 normal
playsound item.firecharge.use hostile @a ~ ~ ~ 2 1.2
playsound block.enchantment_table.use hostile @a ~ ~ ~ 2 1.8
execute as @e[tag=content_lock.enemy_fireball,type=area_effect_cloud,tag=!content_lock.thrown] at @s facing entity @p[tag=content_lock.im_a_target] eyes run tp @s ~ ~ ~ ~ ~

