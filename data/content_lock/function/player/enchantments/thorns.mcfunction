tag @e remove content_lock.thorner
tag @s add content_lock.thorner
execute at @s positioned ~-2 ~ ~-2 at @e[dx=4,dy=2,dz=4,tag=!content_lock.thorner] run particle block{block_state:redstone_block} ~ ~1 ~ 0.2 0.2 0.2 1 5 normal @a
execute at @s positioned ~-2 ~ ~-2 as @e[dx=4,dy=2,dz=4,tag=!content_lock.thorner] run scoreboard players add @s content_lock.bleed_stacks 30
execute at @s positioned ~-2 ~ ~-2 as @e[dx=4,dy=2,dz=4,tag=!content_lock.thorner] run damage @s 2 thorns by @n[tag=content_lock.thorner]
playsound enchant.thorns.hit player @a ~ ~ ~ 1 1
tag @e remove content_lock.thorner